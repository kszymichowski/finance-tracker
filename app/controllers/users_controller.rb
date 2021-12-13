class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

    def search
        if params[:friend].present?
            @friend = User.where(email: params[:friend]).first
            # @friend = params[:friend]
            if @friend
                respond_to do |format|
                    format.js { render partial: 'users/friend_result' }
                end
            else
                respond_to do |format|
                    flash.now[:alert] = "There is no such user"
                    format.js { render partial: 'users/friend_result' }
                end  
            end
        else
             respond_to do |format|
                    flash.now[:alert] = "No email was entered"
                    format.js { render partial: 'users/friend_result' }
             end
        end  
    end
end

class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

    def search
        if params[:friend].present?
            @user_friends = User.search(params[:friend])
            @user_friends = current_user.except_current_user(@user_friends)
            if @user_friends
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
                    flash.now[:alert] = "Please enter a name or email"
                    format.js { render partial: 'users/friend_result' }
             end
        end  
    end
end

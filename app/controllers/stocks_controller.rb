class StocksController < ApplicationController
    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            if @stock
                respond_to do |format|
                    format.js { render partial: 'users/result' }
                end
            else
                respond_to do |format|
                    flash.now[:alert] = "The symbol is not valid"
                    format.js { render partial: 'users/result' }
                end  
            end
        else
             respond_to do |format|
                    flash.now[:alert] = "No symbol was entered"
                    format.js { render partial: 'users/result' }
             end
        end  
    end
end
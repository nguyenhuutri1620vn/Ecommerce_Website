class DiscountsController < ApplicationController
    def index
        @discounts = Discount.all
    end
    
    def new
        @discount = Discount.new
    end
    
    def create
        @discount = Discount.new(discounts_params)
        if @discount.save
          redirect_to discounts_path
        else
          render :new
        end
    end

    def edit
        @discount = Discount.find(params[:id])
    end
    
    def update
        @discount = Discount.find(params[:id])
        if @discount.update(discounts_params)
          redirect_to discounts_path
        else
          render :edit
        end
    end
    
    def destroy
        @discount = Discount.find(params[:id])
        if @discount.destroy
            flash[:success] = 'Discount was successfully deleted.'
            redirect_to discounts_path
        else
            redirect_to discounts_path
        end
    end
    
    private
    def discounts_params
        params.require(:discount).permit(:name, :percent, :starts_at, :ends_at)
    end
end
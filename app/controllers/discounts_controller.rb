class DiscountsController < ApplicationController
    before_action :set_find_id , only: %i[ show edit update destroy ]
    before_action :is_admin?

    def is_admin?
        if logged_in? && current_user.admin == true
        elsif logged_in? && current_user.admin == false
            redirect_to "/403"
        elsif
            flash[:danger] = "Vui lòng đăng nhập"
            redirect_to login_path
        end
    end

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

    def set_find_id
        @discount = Discount.find(params[:id])
    end
end

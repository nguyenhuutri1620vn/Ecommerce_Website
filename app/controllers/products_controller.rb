class ProductsController < ApplicationController
    before_action :set_find_id , only: %i[ show edit update destroy ]
    before_action :set_category , only: %i[new create show edit update ]
    before_action :set_discount , only: %i[new create show edit update ]
    before_action :is_admin?
    include ApplicationHelper

   
    def index
        if params[:term]
            @products = Product.search(params[:term]).paginate(page: params[:page], per_page: 10).order('created_at DESC')
        else
            @products = Product.all.paginate(page: params[:page], per_page: 10).order('created_at DESC')
        end
    end

    def show
        @product = Product.find(params[:id])
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(products_params)
        unless @product.price.nil?
            if @product.discount.percent == 0
                @product.sell_price = nil
            else
                @product.sell_price = @product.price * (100 - (@product.discount.percent / 100)) 
            end
        end
        if @product.save
          redirect_to products_path
        else
          render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.discount_id == 13
            @product.sell_price = @product.price
        else
            @product.sell_price = @product.price * (100 - (@product.discount.percent / 100)) 
        end
        if @product.update(products_params)
            
            redirect_to product_path(params[:id])
        else
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy

        redirect_to products_path
    end

    private
    def products_params
        params.require(:product).permit(:name, :category_id, :price, :description, :image, :quantity, :discount_id, :status)
    end

    def set_category
        @category = Category.where('status', true)
    end
    
    def set_discount
        @discount = Discount.all
    end

    def set_find_id
        @product = Product.find(params[:id])
    end
end

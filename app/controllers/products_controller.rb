class ProductsController < ApplicationController
    before_action :set_category, only: %i[ show edit update create new]
    before_action :set_discount, only: %i[ show edit update create new]

    def index
        @products = Product.all
        @q = Product.ransack(params[:q])
        @products = @q.result.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    end

    def show
        @product = Product.find(params[:id])
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(products_params)
        if @product.save
          @product.sell_price = @product.price * (100 - (@product.discount.percent / 100)) 
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
        @product.sell_price = @product.price * (1 - (@product.discount.percent / 100)) 
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
end

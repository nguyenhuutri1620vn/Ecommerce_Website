class OrderDetailsController < ApplicationController
  before_action :must_login
  include ApplicationHelper

  def create
        chosen_product = Product.find(params[:product_id])
        current_cart = @current_cart
        if current_cart.product.include?(chosen_product)
            @order_detail = current_cart.order_details.find_by(:product_id => chosen_product)
            @order_detail.quantity += 1
        else
            @order_detail = OrderDetail.new 
            @order_detail.cart = current_cart
            @order_detail.product = chosen_product
            @order_detail.quantity = 1
        end     
        @order_detail.price = @order_detail.quantity * @order_detail.product.price
        @order_detail.order_id = Order.maximum(:id).next
        @order_detail.save
        redirect_to cart_path    
    end
       
    def destroy
        @order_detail = OrderDetail.find(params[:id])
        @order_detail.destroy
        redirect_to cart_path
      end  
    def add_quantity
        @order_detail = OrderDetail.find(params[:id])
        if @order_detail.quantity <= @order_detail.product.quantity
          @order_detail.quantity += 1
        else
          @order_detail.quantity == @order_detail.product.quantity
        end
        @order_detail.price = @order_detail.quantity * @order_detail.product.price
        @order_detail.save
        redirect_to cart_path
    end
      
    def reduce_quantity
        @order_detail = OrderDetail.find(params[:id])
        if @order_detail.quantity > 1
          @order_detail.quantity -= 1
        end
        @order_detail.price = @order_detail.quantity * @order_detail.product.price
        @order_detail.save
        redirect_to cart_path
    end

    private
    def order_detail_params 
        params.require(:order_detail).permit(:quantity, :product_id, :cart_id)
    end
end

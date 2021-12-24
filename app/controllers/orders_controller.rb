class OrdersController < ApplicationController
    before_action :set_order, only: %i[show edit update destroy]

		def index
			@orders = Order.paginate(:page => params[:page], :per_page => 10).order('created_at asc')
		end

		def show
			puts "ID #{params[:id]}"
			@orders = OrderDetail.detail(params[:id]).paginate(:page => params[:page], :per_page => 10).order('created_at asc')
		end

		def new
			# @size = Order.get_all.size
		end

		def create

    end

		private
		def set_order
	      @order = Order.find(params[:id])
	  end

	  def order_params
	    params.require(:order).permit(:user_id, :order_id, :product_id, :quantity)
	  end
end
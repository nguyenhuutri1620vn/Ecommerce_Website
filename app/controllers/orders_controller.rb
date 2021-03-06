class OrdersController < ApplicationController
    before_action :set_order, only: %i[show edit update destroy]
	include ApplicationHelper
	before_action :is_admin?
	
	def index
		@orders = Order.list(1).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
	end

	def show		
		@orders = OrderDetail.detail(params[:id]).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')		
	end

	def unapprove
		@orders = Order.list(0).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
	end

	def approve
		Order.approve(params[:id])
		@orders = OrderDetail.detail(params[:id]).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')		
	end

	def new

	end

	def create

	end

	private
	def set_order
		@order = Order.find(params[:id])
  	end

  	def order_params
    	params.require(:order).permit(:user_id, :order_id, :product_id, :quantity, :status)
  	end
end
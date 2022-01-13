class FrontendController < ApplicationController
  include ApplicationHelper
  before_action :had_login, only: [:new, :create]
  layout 'frontend'

  def index
    @categories = Category.list(true)
    if params[:term]
      @products = Product.search(params[:term]).paginate(page: params[:page], per_page: 18).list(true).order('created_at DESC')
    else
        @products = Product.all.paginate(page: params[:page], per_page: 18).list(true).order('created_at DESC')
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  #register
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      flash[:success] = "Đăng ký thành công"
      redirect_to login_path
    else
      render :new
    end
  end

  def select_category
    @categories = Category.list(true)
    if params[:term]
      @products = Product.search(params[:term]).paginate(page: params[:page], per_page: 18).selectcate(params[:id]).list(true).order('created_at DESC')
    else
        @products = Product.all.paginate(page: params[:page], per_page: 18).selectcate(params[:id]).list(true).order('created_at DESC')
    end
  end

  def editprofile
    @current_user
  end

  def updateprofile
    @current_user.skip_validations = true
    if @current_user.update(update_params)
      redirect_to profile_path
    else
      render :editprofile
    end
  end

  def changepasscustomer
  end

  def updatepasscustomer
    
    if @current_user.update(change_password)
      redirect_to profile_path
    else
      flash[:danger] = 'Đổi mật khẩu không thành công'
      render :changepasscustomer
    end
  end

  def orderhistory
    @orders = Order.user(current_user.id).order('created_at DESC')
  end

  def orderdetail
    @orderdetails = OrderDetail.detail(params[:id]).order('created_at DESC')
  end

  def createorder
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    # @order.quantity = @order_detail.quantity
    @order.total_price = @current_cart.sub_total
    @order.status = 0
    @order.quantity = @current_cart.sum_quan
    @order.save
    
    session[:cart_id] = nil
    redirect_to thankyou_path
  end

  def thankyou

  end

  private 
  def user_params
    params.permit(:email, :password, :password_confirmation, :address, :phone, :full_name)
  end

  def change_password
    params.permit(:password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:address, :phone, :full_name)
  end

  def order_params 
    params.permit(:user_id, :quantity, :total_price)
  end
end
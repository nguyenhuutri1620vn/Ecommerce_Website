class FrontendController < ApplicationController
  before_action :had_login, only: [:new, :create]
  
  layout 'frontend'
  def had_login
      unless current_user.nil?
          redirect_to frontend_index_path
      end
  end

  def index
    @categories = Category.where('status = true')
    @q = Product.ransack(params[:q])
    @products = @q.result.paginate(page: params[:page], per_page: 20).where('status = true').order('created_at DESC')
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
    @categories = Category.where('status = true')
    @q = Product.ransack(params[:q])
    @products = @q.result.paginate(page: params[:page], per_page: 20).where("category_id = #{params[:id]}", "status = true").order('created_at DESC')
  end

  def editprofile 
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

  private 
  def user_params
    params.permit(:email, :password, :password_confirmation, :address, :phone, :full_name)
  end

  def change_password
    params.permit(:password, :password_confirmation)
  end
end
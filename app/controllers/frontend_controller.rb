class FrontendController < ApplicationController
  def index
    @products = Product.where('status = true')
    @q = Product.ransack(params[:q])
    @products = @q.result.paginate(page: params[:page], per_page: 20).order('created_at DESC')
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
    @user.role = false
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end


  private 
  def user_params
    params.permit(:email, :password, :password_confirmation, :address, :phone, :full_name)
  end
end
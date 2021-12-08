class FrontendController < ApplicationController
  def index
  end

  def show
    @user = User.find_by id: params[:id]
  end
  #register
  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)   
      @user.role = false
      if @user.save
        redirect_to '/login'
      else
        render :new
      end
  end


  private 
  def user_params
      params.permit(:email, :password, :password_confirmation, :address, :phone, :full_name)
  end
end

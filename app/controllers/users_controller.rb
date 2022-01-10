class UsersController < ApplicationController
  before_action :set_find_id , only: %i[ show edit update destroy changepassword updatepassword]
  before_action :is_admin?
  include ApplicationHelper
  #show admin list
  def index
    if params[:term]
      @users = User.search(params[:term]).paginate(page: params[:page], per_page: 10).list(true).order('created_at DESC')
    else
      @users = User.all.paginate(page: params[:page], per_page: 10).list(true).order('created_at DESC')
    end
  end
  #show customer list
  def list_customer
    # @q = User.ransack(params[:q])
    # @customers = @q.result.paginate(page: params[:page], per_page: 10).list(false).order('created_at DESC')
    if params[:term]
      @customers = User.search(params[:term]).paginate(page: params[:page], per_page: 10).list(false).order('created_at DESC')
    else
      @customers = User.all.paginate(page: params[:page], per_page: 10).list(false).order('created_at DESC')
    end
  end
  #show detail user
  def show
    @customers = User.find(params[:id])
  end
  #create new admin
  def new
      @user = User.new
  end
  
  def create
    @user = User.new(user_params)   
    @user.admin = true
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  #update admin
  def edit
  end

  def update
    if @user.update(update_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  #change password admin
  def changepassword
  end

  def updatepassword
    if @user.update(change_password)
      redirect_to users_path
    else
      render :changepassword
    end
  end

  #destroy user
  def destroy
    @user.destroy
    redirect_to users_path
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :address, :phone, :full_name)
  end

  def update_params
    params.permit(:email, :address, :phone, :full_name)
  end

  def change_password
    params.permit(:password, :password_confirmation)
  end

  def set_find_id
    @user = User.find(params[:id])
  end
end

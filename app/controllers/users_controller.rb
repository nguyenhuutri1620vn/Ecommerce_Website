class UsersController < ApplicationController
    before_action :set_find_id, only: %i[show edit update destroy changepassword updatepassword]

    def index
      @users = User.where('role' , 1)
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)   
      @user.role = true
      if @user.save
        redirect_to users_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update(update_params)
        redirect_to user_path(params[:id])
      else
        render :edit
      end
    end

    def changepassword
    end

    def updatepassword
      if @user.update(change_password)
        redirect_to users_path
      else
        render :changepassword
      end
    end
  
    def destroy
      @user.destroy
  
      redirect_to users_path
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :address, :phone, :full_name)
    end

    def update_params
      params.require(:user).permit(:email, :address, :phone, :full_name)
    end

    def change_password
      params.permit(:password, :password_confirmation)
    end

    def set_find_id
      @user = User.find(params[:id])
    end
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
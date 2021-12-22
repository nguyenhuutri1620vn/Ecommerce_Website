class AuthenticationController < ApplicationController
    # skip_before_action :require_login, only: [:new, :create]
    before_action :had_login, only: [:new, :create]
    layout 'frontend'
    def had_login
        unless current_user.nil?
            redirect_to frontend_index_path
        end
    end
    #login
    def new
    end

    def create
        user = User.find_by email: params[:session][:email]
        if user && user.authenticate(params[:session][:password]) && user.admin == true
            log_in user
            redirect_to products_path
        elsif user && user.authenticate(params[:session][:password]) && user.admin == false
            log_in user
            redirect_to frontend_index_path
        else
            flash[:danger] = "Tài khoản hoặc mật khẩu không đúng"
            render :new
        end
    end

    # logout
    def destroy
        log_out
    end

end

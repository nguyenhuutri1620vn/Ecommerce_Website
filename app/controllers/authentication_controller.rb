class AuthenticationController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    layout 'frontend'

    #login
    def new
    end

    def create
        user = User.find_by email: params[:session][:email]
        if user && user.authenticate(params[:session][:password])
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

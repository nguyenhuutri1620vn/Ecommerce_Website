module AuthenticationHelper
    def log_in user
        session[:user_id] = user.id
    end

    def log_out
        session.delete :user_id
    end

    # GET current_user 
    def current_user
        @current_user ||= User.find_by id: session[:user_id]
    end

    # Check user has logged in before ? 
    def logged_in?
        current_user.present?
    end
end

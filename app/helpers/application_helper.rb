module ApplicationHelper
    def is_admin?
        if logged_in? && current_user.admin == true
        elsif logged_in? && current_user.admin == false
            redirect_to "/403"
        elsif
            flash[:danger] = "Vui lòng đăng nhập"
            redirect_to login_path
        end
    end
    
    def had_login
        unless current_user.nil?
            redirect_to frontend_index_path
        end
    end 

    def must_login
        if current_user.nil?
            redirect_to login_path
        end
    end
end

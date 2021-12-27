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
end

class ApplicationController < ActionController::Base
  include AuthenticationHelper
  add_flash_types :info, :error, :warning
  protect_from_forgery with: :exception
  before_action :require_login

  def require_login
    unless logged_in?
      
    end
  end

  def is_admin?
      if logged_in? && current_user.admin == true
          redirect_to products_path
      elsif logged_in? && current_user.admin == false
          redirect_to frontend_index_path
      elsif
          redirect_to login_path
      end
  end

end

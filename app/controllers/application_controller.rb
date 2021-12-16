class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  protect_from_forgery with: :exception
  include AuthenticationHelper

  before_action :require_login
  def require_login
    unless logged_in?
      redirect_to login_path
    else

    end
  end
end

class ApplicationController < ActionController::Base
  include AuthenticationHelper
  add_flash_types :info, :error, :warning
  protect_from_forgery with: :exception
  before_action :require_login

  def require_login
    unless logged_in?
    end
  end
  
end

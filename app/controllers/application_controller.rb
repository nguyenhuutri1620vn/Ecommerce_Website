class ApplicationController < ActionController::Base
  include AuthenticationHelper
  add_flash_types :info, :error, :warning
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :current_cart

  def require_login
    unless logged_in?
    end
  end

  private 
  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end
    if session[:cart_id] == nil 
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
  
end

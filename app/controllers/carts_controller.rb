class CartsController < ApplicationController
  layout 'frontend'
  before_action :is_admin?
  include ApplicationHelper
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to frontend_index_path
  end
end

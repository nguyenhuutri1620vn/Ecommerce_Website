class CartsController < ApplicationController
  before_action :set_link, only:[:destroy]
  before_action :authenticate_user!

  private
  def cart_params
    params.require(:cart).permit(:quantity)
  end

  public
  def index
    @carts = Cart.where(user_id: current_user.id)
  end

  def show
    @cart = Cart.find(params[:id])
  end

  #POST /carts them san pham vao gio hang [product_id,quantity]
  def create
    #San pham da co trong gio hang
    if (@cart = Cart.find_by(user_id: current_user.id,product_id: params[:product_id]))
      @cart.quantity += 1
      params[:id] = @cart.id
      params[:cart] = @cart
      self.update
    else
      @cart = Cart.new(:user_id => current_user.id,:product_id => params[:product_id],:quantity =>params[:quantity])
      if @cart.save
        flash[:notice]= "Da them san pham vao gio hang"
      else
        flash[:notice]= "Da xay ra loi"
      end
    end
  end

  def edit
    @carts = Cart.where(current_user.id)

  end
  #Tang hoac giam so luong san pham
  def update
    @cart = Cart.find(params[:id])
    #if @cart.update(:quantity => params[:quantity])
    if @cart.update(cart_params)
      flash[:notice]= "Da thay doi gio hang"
    else
      flash[:notice]= "Da xay ra loi"
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    if @cart.user_id == current_user.id && @cart.destroy
      flash[:notice]= "Da xoa san pham"
    else
      flash[:notice]= "Da xay ra loi khi xoa san pham"
    end
  end
end

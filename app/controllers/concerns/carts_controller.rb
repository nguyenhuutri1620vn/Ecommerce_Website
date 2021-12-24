class CartsController < ApplicationController

  def index
    @carts = Cart.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    # puts "zxc #{@carts.to_s}"
    # @carts.temp << "zxc"

    i = 0
    @user_name = []
    @product_name = []
    @carts.each{
        |x|
        user = User.find(x.user_id.to_s)
        product = Product.find(x.product_id.to_s)
        puts "jashdjiashsdjahsdjkhasdj #{i}"
        @user_name[i] = user.full_name
        @product_name[i] = product.name
        puts "asdkjalksdjlaksda #{@product_name[i]}"
        i+=1
      }
      # puts "SIZE #{@user_name}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :product_id)
    end
end
class DashboardController < ApplicationController
    include ApplicationHelper
    before_action :is_admin?

    def index
        @products_dashboard = []
        @totalprice = [];

        @orders = Order.all.count
        @products = Product.all.count
        @staffs = User.list(true).count
        @customers = User.list(false).count

        product_sold = Order.list(1).sum('quantity')
        @total_product = Product.all.sum('quantity')
        product_nosold = @total_product - product_sold

        @products_dashboard << product_sold << product_nosold   

        for i in 1..12
            month = Order.where("EXTRACT(MONTH FROM created_at) = ?", i).where("EXTRACT(YEAR FROM created_at) = 2022").sum('total_price')
            @totalprice << (month.to_i/1000000)
        end

        day = Time.now.strftime("%d")
        month = Time.now.strftime("%m")
        year = Time.now.strftime("%Y")
        @orderday = Order.where("EXTRACT(YEAR FROM created_at) = ?", year).where("EXTRACT(MONTH FROM created_at) = ?", month).where("EXTRACT(day FROM created_at) = ?",day).count
        @order_total_money = Order.where("EXTRACT(YEAR FROM created_at) = ?", year).where("EXTRACT(MONTH FROM created_at) = ?", month).where("EXTRACT(day FROM created_at) = ?",day).sum('total_price')
        @products_detail_sold = OrderDetail.where("EXTRACT(YEAR FROM created_at) = ?", year).where("EXTRACT(MONTH FROM created_at) = ?", month).where("EXTRACT(day FROM created_at) = ?",day)

    end

end

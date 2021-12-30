class DashboardController < ApplicationController
    include ApplicationHelper
    before_action :is_admin?

    def index
        @orders = Order.list(1).count
        @products = Product.all.count
        @staffs = User.list(true).count
        @customers = User.list(false).count
    end

end

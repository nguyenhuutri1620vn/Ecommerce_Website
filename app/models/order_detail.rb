class OrderDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :order, optional: true


  def self.detail(id)
    if id
      #Inner Join voi Product
      OrderDetail.all.joins(:product).where('order_id = ?', "#{id}")
    else
      all
    end
  end
  def total_price
    self.quantity * self.product.price
  end
end

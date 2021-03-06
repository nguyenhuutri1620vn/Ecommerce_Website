class OrderDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  # validates :order, :product, presence: true
  after_destroy :log_destroy_action
  belongs_to :order, optional: true


  def self.detail(id)
    if id
      #Inner Join voi Product
      OrderDetail.all.joins(:product).where('order_id = ?', "#{id}")
    else
      all
    end
  end

  def log_destroy_action
    puts 'Orderdetail destroyed'
  end
  
  def total_price
    self.quantity * self.product.price
  end
end

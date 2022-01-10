class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order, :product, presence: true
  after_destroy :log_destroy_action

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
end

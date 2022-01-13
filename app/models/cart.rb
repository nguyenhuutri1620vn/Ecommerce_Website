class Cart < ApplicationRecord

  has_many :order_details, dependent: :destroy
  has_many :product, through: :order_details
  # validates :user, :product, presence: true

  def sub_total
    sum = 0
    self.order_details.each do |order_detail|
    sum+= order_detail.total_price
    end
    return sum
end
end

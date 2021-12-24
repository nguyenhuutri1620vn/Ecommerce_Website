class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order, :product, presence: true

  def self.detail(id)
    puts "detail #{id}"
    if id
      where('order_id = ?', "#{id}")
    else
      all
    end
  end
end

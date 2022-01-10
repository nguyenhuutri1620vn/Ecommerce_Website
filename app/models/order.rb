class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  validates :user, presence: true

  def self.list(status)
    where('status = ?', "#{status}")
  end

  def self.approve(id)
    item = Order.find(id)
    item.update(status: 1)
  end

  def self.user(id)
    where('user_id = ?', "#{id}")
  end
end

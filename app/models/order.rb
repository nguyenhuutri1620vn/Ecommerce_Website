class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  validates :user, presence: true

  def self.list(status)
    where('status = ?', "#{status}")
  end
end

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  validates :user, presence: true
end

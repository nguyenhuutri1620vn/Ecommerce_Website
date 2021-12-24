class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  validates :user, presence: true

  # def self.get_all()    
  #   where('1 = 1')
  # end
end

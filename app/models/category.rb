class Category < ApplicationRecord
  has_many :products

  validates :name, presence: {message: 'Vui lòng nhập tên loại sản phẩm'}
end

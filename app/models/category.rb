class Category < ApplicationRecord
  has_many :products 
  validates :name, presence: {message: "Vui lòng nhập tên loại sản phẩm"}, length: {maximum: 30,
  too_long: "Tên loại sản phẩm không quá 30 kí tự"}
end

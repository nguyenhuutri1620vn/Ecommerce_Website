class Product < ApplicationRecord
  has_many :carts
  has_many :order_details
  belongs_to :category
  belongs_to :discount
  has_one_attached :image

  validates :category_id, presence: {message: 'Vui lòng chọn lọai sản phẩm'}
  validates :name , presence: {message: 'Vui lòng nhập tên sản phẩm'}
  validates :price , numericality: {message: 'Giá sản phẩm phải là số'}, presence: {message: 'Vui lòng nhập giá sản phẩm'}
  validates :quantity , numericality: {message: 'Số lượng sản phẩm phải là số'}, presence: {message: 'Vui lòng nhập số lượng sản phẩm'}
  validates :image , presence: {message: 'Hình ảnh chưa được upload'}
  validates :description , presence: {message: 'Vui lòng nhập mô tả'}
  validates :discount_id, presence: {message: 'Vui lòng chọn mã giảm giá'}
end

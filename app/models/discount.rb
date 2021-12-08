class Discount < ApplicationRecord
  has_many :products

  validates :name, presence: {message: "Vui lòng nhập tên mã"}
  validates :percent, presence: {message: "Vui lòng nhập phần trăm giảm"}
  validates :starts_at, presence: {message: "Vui lòng nhập ngày bắt đầu"}
  validates :ends_at, presence: {message: "Vui lòng nhập ngày kết thúc"}

end

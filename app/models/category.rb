class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: {message: 'Vui lòng nhập tên loại sản phẩm'}

  def self.list(status)
    where('status = ?', "#{status}")
  end
end

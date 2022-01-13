class User < ApplicationRecord
  include PgSearch
  pg_search_scope :search, against: [:email, :full_name, :phone],
  using: {
    tsearch:{ prefix: true } 
  }

  has_secure_password validations: false

  has_many :carts
  has_many :orders
  attr_accessor :skip_validations

  validates :password, presence: {message: "Vui lòng nhập mật khẩu"}, confirmation: {message: 'Mật khẩu không trùng khớp'}, 
  length: {minimum:6,  message: "Mật khẩu phải trên 6 kí tự"}, unless: :skip_validations
  validates :full_name, presence: {message: "Vui lòng nhập họ và tên"}, on: [:create, :update]
  validates :email, presence: {message: "Vui lòng nhập email"}, uniqueness: {message: "Email đã được đăng ký"}, 
  format: { with: URI::MailTo::EMAIL_REGEXP , message: "Email không đúng định dạng"} , on: [:create, :update]
  validates :address, presence: {message: "Vui lòng nhập địa chỉ"}, on: [:create, :update]
  validates :phone, length: {is: 9, message: 'Số điện thoại không đúng'}, on: [:create, :update]

  validates_confirmation_of :password, allow_blank: true

  def self.list(status)
    where('admin = ?', "#{status}")
  end
end

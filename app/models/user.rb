class User < ApplicationRecord
  has_secure_password validations: false

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  has_many :carts
  has_many :orders

  validates :password, presence: {message: "Vui lòng nhập mật khẩu"}, confirmation: true, length: {minimum:6,
  message: "Mật khẩu phải trên 6 kí tự"}, on: [:create , :updatepassword]
  validates :full_name, presence: {message: "Vui lòng nhập họ và tên"}, on: [:create, :update]
  validates :email, presence: {message: "Vui lòng nhập họ và tên"}, on: [:create, :update]
  validates :address, presence: {message: "Vui lòng nhập địa chỉ"}, on: [:create, :update]
  validates :phone, length: {is: 9, message: 'Số điện thoại không đúng'}, on: [:create, :update]

  validates_confirmation_of :password, allow_blank:{message: 'Mật khẩu không trùng khớp'}
end

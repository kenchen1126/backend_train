class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: {:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}

  has_many :tasks, dependent: :destroy
  # 密碼加密
  has_secure_password
  enum authority: [ "member", "admin"]

end

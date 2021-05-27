class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true
  validates :password, : true
end

class User < ApplicationRecord
  before_destroy :check_last_admin
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: {:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  has_many :tasks, dependent: :destroy
  has_secure_password
  enum authority: [ "member", "admin"]


  private
    def check_last_admin
      if User.admin.count == 1 && self.admin?
        errors.add(:base, I18n.t("user.last_admin"))
        throw :abort
      end
    end
end

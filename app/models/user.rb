class User < ApplicationRecord
  has_many :shops
  has_secure_password

  enum role: { super_admin: 0, admin: 1, customer: 2 }
  validates :email, presence: true, uniqueness: true

end

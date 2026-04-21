class Shop < ApplicationRecord
  belongs_to :user
  has_many :services
  has_many :bookings
end

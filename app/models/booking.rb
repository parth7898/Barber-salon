class Booking < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  enum status: { confirmed: 0, completed: 1, cancelled: 2 }
end

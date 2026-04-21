# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  before_action :authorize_request
  before_action :authorize_admin!

  def index
    shop = current_user.shops.find(params[:shop_id])
    bookings = shop.bookings.order(created_at: :desc)

    render json: bookings
  end
end
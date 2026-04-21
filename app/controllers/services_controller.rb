
class ServicesController < ApplicationController
  before_action :authorize_request
  before_action :authorize_admin!

  def index
    services = Service.where(shop_id: params[:shop_id])
    render json: services
  end

  def create
    shop = current_user.shops.find(params[:shop_id])

    service = shop.services.new(service_params)

    if service.save
      render json: service
    else
      render json: { errors: service.errors.full_messages }
    end
  end

  private

  def service_params
    params.permit(:name, :price, :duration)
  end
end
class ShopsController < ApplicationController
  before_action :authorize_request
  before_action :authorize_admin!
  before_action :set_shop, only: [:show, :update, :destroy]

  def index
    render json: current_user.shops
  end

  def create
    shop = current_user.shops.new(shop_params)

    if shop.save
      render json: shop, status: :created
    else
      render json: { errors: shop.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @shop
  end

  def update
    if @shop.update(shop_params)
      render json: @shop
    else
      render json: { errors: @shop.errors.full_messages }
    end
  end

  def destroy
    @shop.destroy
    render json: { message: 'Deleted successfully' }
  end

  private

  def set_shop
    @shop = current_user.shops.find(params[:id])
  end

  def shop_params
    params.permit(:name, :address, :open_time, :close_time)
  end
end
class ShopsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @shop = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    Shop.create(shop_params)
    redirect_to root_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :image, :address, :tel)
  end
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end

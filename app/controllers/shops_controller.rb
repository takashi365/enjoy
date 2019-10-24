class ShopsController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :ranking
  def index
    @shop = Shop.all
    @review = Review.all
  end

  def show
    @shop = Shop.find(params[:id])
    @review = Review.all
  end

  def new
    @shop = Shop.new
  end

  def create
    Shop.create(shop_params)
    redirect_to root_path
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to root_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :image, :address, :tel).merge(shop_id: params[:id], user_id: current_user.id)
  end
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
  def ranking
    @ranking = Shop.limit(5)
  end
end

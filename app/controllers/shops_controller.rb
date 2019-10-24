class ShopsController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :ranking
  def index
    @shop = Shop.all
    @aichi = Shop.where("address LIKE ?", "%愛知%")
    @gifu = Shop.where("address LIKE ?", "%岐阜%")
    @mie = Shop.where("address LIKE ?", "%三重%")
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

  def ranking
    shop_ids = Review.group(:shop_id).order('count_shop_id DESC').limit(5).count(:shop_id).keys
    @ranking = shop_ids.map{ |id| Shop.find(id) }
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :image, :address, :tel)
  end
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end

class ReviewsController < ApplicationController
  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    # トップページにリダイレクトする
    redirect_to controller: :shops, action: :index
  end

  private
  def create_params
    params.require(:review).permit(:rate, :review).merge(shop_id: params[:shop_id], user_id: current_user.id)
  end
end

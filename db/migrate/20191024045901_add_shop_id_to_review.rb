class AddShopIdToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :shop_id, :integer
  end
end

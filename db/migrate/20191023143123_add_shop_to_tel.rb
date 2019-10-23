class AddShopToTel < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :tel, :integer
  end
end

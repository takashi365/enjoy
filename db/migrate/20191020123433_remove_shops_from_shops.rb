class RemoveShopsFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :shops, :string
  end
end

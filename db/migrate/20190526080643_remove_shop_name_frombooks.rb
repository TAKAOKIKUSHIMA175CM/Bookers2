class RemoveShopNameFrombooks < ActiveRecord::Migration[5.2]
  def change
  	rename_column :books, :shop_name, :title
  end
end

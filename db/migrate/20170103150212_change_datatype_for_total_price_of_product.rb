class ChangeDatatypeForTotalPriceOfProduct < ActiveRecord::Migration
  def change
  	remove_column :products, :total_price
  	add_column :products, :total_price, :decimal, precision: 10, scale: 3
  end
end

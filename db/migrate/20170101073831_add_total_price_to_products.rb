class AddTotalPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :total_price, :float
    add_column :products, :majdoori, :float
  end
end

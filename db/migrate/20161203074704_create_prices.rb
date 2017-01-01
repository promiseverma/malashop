class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.references :product, index: true
      t.references :material, index: true
      t.integer :quantity
      t.float :calculated_price
      t.string :unit

      t.timestamps null: false
    end
    add_foreign_key :prices, :products
    add_foreign_key :prices, :materials
  end
end

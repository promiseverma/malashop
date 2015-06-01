class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_number
      t.string :name, limit: 45
      t.text :description

      t.timestamps null: false
    end
  end
end

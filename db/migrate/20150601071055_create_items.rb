class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name, limit: 50
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :products
  end
end

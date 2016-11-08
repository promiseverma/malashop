class CreateNotepads < ActiveRecord::Migration
  def change
    create_table :notepads do |t|
      t.date :note_date
      t.string :name
      t.float :amount
      t.integer :status

      t.timestamps null: false
    end
  end
end

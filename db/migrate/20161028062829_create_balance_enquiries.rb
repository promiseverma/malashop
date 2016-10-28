class CreateBalanceEnquiries < ActiveRecord::Migration
  def change
    create_table :balance_enquiries do |t|
      t.integer :lena
      t.integer :dena
      t.date :balance_date

      t.timestamps null: false
    end
  end
end

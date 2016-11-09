class AddKarigarToBalanceEnquiry < ActiveRecord::Migration
  def change
    add_reference :balance_enquiries, :karigar, index: true
    add_foreign_key :balance_enquiries, :karigars
  end
end

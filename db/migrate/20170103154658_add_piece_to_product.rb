class AddPieceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :piece, :integer
  end
end

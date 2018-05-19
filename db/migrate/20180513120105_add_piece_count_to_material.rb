class AddPieceCountToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :piece_count, :integer
  end
end

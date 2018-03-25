class AddDeletedAtToNotepad < ActiveRecord::Migration
  def change
    add_column :notepads, :deleted_at, :datetime
    add_index :notepads, :deleted_at
  end
end

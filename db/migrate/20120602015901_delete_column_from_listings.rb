class DeleteColumnFromListings < ActiveRecord::Migration
  def up
    remove_column :listings, :original
    remove_column :listings, :flag_for_delete
  end

  def down
  end
end

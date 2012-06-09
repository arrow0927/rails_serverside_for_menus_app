class RenameColumnUrl < ActiveRecord::Migration
  def up
    rename_column :listings, :url, :notes
  end

  def down
  end
end

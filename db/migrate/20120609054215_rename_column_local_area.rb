class RenameColumnLocalArea < ActiveRecord::Migration
  def up
    rename_column :listings, :localArea, :local_area
  end

  def down
  end
end

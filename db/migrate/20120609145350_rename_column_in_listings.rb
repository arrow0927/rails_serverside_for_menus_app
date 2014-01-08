class RenameColumnInListings < ActiveRecord::Migration
  def up
    rename_column :listings, :get_menu_from_website?, :get_menu_from_website
  end

  def down
  end
end

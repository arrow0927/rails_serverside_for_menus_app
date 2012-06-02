class AddColumnToListings < ActiveRecord::Migration
  def change
    add_column :listings, :original, :boolean
    add_column :listings, :flag_for_delete, :boolean
    add_column :listings, :checked, :boolean
    add_column :listings, :menu_collected, :boolean
    add_column :listings, :menu_digitized, :boolean
    add_column :listings, :menu_in_database, :boolean
  end
end

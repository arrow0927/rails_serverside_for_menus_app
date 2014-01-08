class AddColumnsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :menu_state, :string
    add_column :listings, :menu_source, :string
  end
end

class AddRetainColumnToListings < ActiveRecord::Migration
  def change
    add_column :listings, :keep, :boolean, :default => true
  end
end

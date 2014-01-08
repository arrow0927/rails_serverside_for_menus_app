class RemoveImageColumnsFromListing < ActiveRecord::Migration
  def up
    remove_column :listings, :image_file_name
    remove_column :listings, :image_content_type
    remove_column :listings, :image_file_size
  end

  def down
  end
end

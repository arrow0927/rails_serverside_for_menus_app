class AddImageColumnsToListing < ActiveRecord::Migration
  def change
    add_column  :listings, :image_file_name, :string
    add_column  :listings, :image_content_type, :string
    add_column  :listings, :image_file_size, :integer
    
  end
end

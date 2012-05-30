class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_description
      t.string :image_file_path
      t.integer :image_file_size
      t.string :image_file_name
      t.string :image_content_type

      t.timestamps
    end
  end
end

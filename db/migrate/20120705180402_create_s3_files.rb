class CreateS3Files < ActiveRecord::Migration
  def change
    create_table :s3_files do |t|
      t.string :url
      t.string :name
      t.string :owner
      t.text :notes


      t.timestamps
    end
  end
end

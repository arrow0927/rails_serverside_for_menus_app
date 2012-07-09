class RemoveColsFromS3File < ActiveRecord::Migration
  def up
    remove_column :s3_files , :url
    remove_column :s3_files , :name
  end

  def down
  end
end

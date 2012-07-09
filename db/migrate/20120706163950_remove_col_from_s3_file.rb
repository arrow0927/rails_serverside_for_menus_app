class RemoveColFromS3File < ActiveRecord::Migration
  def up
    remove_column :s3_files , :uploaded_file_file_name
    remove_column :s3_files , :uploaded_file_content_type
    remove_column :s3_files , :uploaded_file_file_size
    remove_column :s3_files , :uploaded_file_updated_at
  end

  def down
  end
end

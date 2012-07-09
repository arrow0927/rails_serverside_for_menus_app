class AddAttachmentUploadToS3Files < ActiveRecord::Migration
  def self.up
    add_column :s3_files, :upload_file_name, :string
    add_column :s3_files, :upload_content_type, :string
    add_column :s3_files, :upload_file_size, :integer
    add_column :s3_files, :upload_updated_at, :datetime
  end

  def self.down
    remove_column :s3_files, :upload_file_name
    remove_column :s3_files, :upload_content_type
    remove_column :s3_files, :upload_file_size
    remove_column :s3_files, :upload_updated_at
  end
end

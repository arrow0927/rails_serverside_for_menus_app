class AddColToS3File < ActiveRecord::Migration
  def change
    add_column :s3_files, :owner_role, :string
  end
end

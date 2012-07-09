class AddColsTos3File < ActiveRecord::Migration
  def up
    add_column :s3_files, :last_accessed_by_user, :string
    add_column :s3_files, :last_accessed_time_stamp, :datetime
  end

  def down
  end
end

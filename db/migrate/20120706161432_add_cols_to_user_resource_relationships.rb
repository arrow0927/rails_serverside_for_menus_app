class AddColsToUserResourceRelationships < ActiveRecord::Migration
  def change
    add_column :user_resource_relationships, :last_accessed_by_user, :string
    add_column :user_resource_relationships, :last_accessed_time_stamp, :datetime
  end
end

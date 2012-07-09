class RemoveColsFromUserResourceRelationship < ActiveRecord::Migration
  def up
    remove_column :user_resource_relationships , :flag_as_deleted
    remove_column :user_resource_relationships , :last_accessed_by_user
    remove_column :user_resource_relationships , :last_accessed_time_stamp
  end

  def down
  end
end

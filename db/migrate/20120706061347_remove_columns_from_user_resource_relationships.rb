class RemoveColumnsFromUserResourceRelationships < ActiveRecord::Migration
  def up
    remove_column :user_resource_relationships , :summary
    remove_column :user_resource_relationships , :file_type
    remove_column :user_resource_relationships , :filepath
  end

  def down
  end
end

class AddFiletypeToUserResourceRelationships < ActiveRecord::Migration
  def change
    add_column :user_resource_relationships, :file_type, :string
  end
end

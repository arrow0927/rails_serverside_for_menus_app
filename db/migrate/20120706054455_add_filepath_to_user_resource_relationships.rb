class AddFilepathToUserResourceRelationships < ActiveRecord::Migration
  def change
    add_column :user_resource_relationships, :filepath, :string
  end
end

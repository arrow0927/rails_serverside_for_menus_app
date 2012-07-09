class AddSummaryToUserResourceRelationships < ActiveRecord::Migration
  def change
    add_column :user_resource_relationships, :summary, :text
  end
end

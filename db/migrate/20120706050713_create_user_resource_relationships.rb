class CreateUserResourceRelationships < ActiveRecord::Migration
  def change
    create_table :user_resource_relationships do |t|

      t.references :s3_file
      t.references :user
      t.string :summary
      t.boolean :flag_as_deleted
      t.timestamps
    end
    add_index :user_resource_relationships, ['s3_file_id', 'user_id' ]

  end
end

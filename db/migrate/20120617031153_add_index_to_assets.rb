class AddIndexToAssets < ActiveRecord::Migration
  def change
    add_index :assets, :user_id
  end
end

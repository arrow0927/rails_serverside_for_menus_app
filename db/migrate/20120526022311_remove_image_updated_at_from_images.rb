class RemoveImageUpdatedAtFromImages < ActiveRecord::Migration
  def up
    remove_column :images, :image_updated_at
  end

  def down
  end
end

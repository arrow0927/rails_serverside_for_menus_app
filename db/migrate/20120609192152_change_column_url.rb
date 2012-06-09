class ChangeColumnUrl < ActiveRecord::Migration
  def up
    remove_column :listings, :url
  end

  def down
  end
end

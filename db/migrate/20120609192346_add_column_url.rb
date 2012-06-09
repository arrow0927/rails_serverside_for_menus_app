class AddColumnUrl < ActiveRecord::Migration
  def up
    add_column :listings, :url, :text
  end

  def down
  end
end

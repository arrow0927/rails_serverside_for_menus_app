class AddColumnTomenuItems < ActiveRecord::Migration
  def up
    add_column :menu_items, :typist, :string
  end

  def down
  end
end

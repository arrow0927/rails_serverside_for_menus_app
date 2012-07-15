class AddColumnsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :description, :text
    add_column :tasks, :Status, :string
    add_column :tasks, :start_time, :string

  end
end

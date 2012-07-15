class ManageColumnsInTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :last_run_by_user, :string
    add_column :tasks, :output_from_last_run, :text
    remove_column :tasks, :Status
    remove_column :tasks, :start_time

    rename_column :tasks, :name, :last_run_at_time
  end

  def down
  end
end

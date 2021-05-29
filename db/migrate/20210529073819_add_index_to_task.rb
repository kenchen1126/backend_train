class AddIndexToTask < ActiveRecord::Migration[6.1]
  def up
    add_index :tasks, :name
    add_index :tasks, :status
  end

  def down
    remove_index :tasks, name: "index_tasks_on_name"
    remove_index :tasks, name: "index_tasks_on_status" 
  end

end

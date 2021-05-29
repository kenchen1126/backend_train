class AddIndexToPriority < ActiveRecord::Migration[6.1]
  def up
    add_index :tasks, :priority
  end

  def down
    remove_index :tasks, name: "index_tasks_on_priority"
  end
end

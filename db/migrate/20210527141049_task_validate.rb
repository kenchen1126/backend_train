class TaskValidate < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :name, false
    change_column_null :tasks, :status, false
    change_column_null :tasks, :priority, false
  end
end

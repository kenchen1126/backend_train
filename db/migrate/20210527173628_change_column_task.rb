class ChangeColumnTask < ActiveRecord::Migration[6.1]
  def up
    change_column :tasks, :priority, :integer, default: 0
    change_column :tasks, :status, :integer, default: 0
  end

  def down
    change_column :tasks, :priority, :integer 
    change_column :tasks, :status, :integer
  end
end

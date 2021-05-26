class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :priority
      t.integer :status
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end

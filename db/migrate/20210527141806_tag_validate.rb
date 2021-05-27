class TagValidate < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tags, :name, false
    change_column :tags, :name, :string, unique: true
  end
end

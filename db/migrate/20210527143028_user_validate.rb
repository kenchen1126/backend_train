class UserValidate < ActiveRecord::Migration[6.1]
  def up
    change_column_null :users, :name, false
    change_column_null :users, :email, false
    change_column_null :users, :password, false
    change_column :users, :name, :string, unique: true
    change_column :users, :email, :string, unique: true
  end

  def down
    change_column_null :users, :name, true
    change_column_null :users, :email, true
    change_column_null :users, :password, true
    change_column :users, :name, :string, unique: false
    change_column :users, :email, :string, unique: false
  end
end

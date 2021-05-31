class AddPasswordDigestToUser < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :password
    add_column :users, :password_digest, :string, null: false
  end
  def down
    add_column :users, :password, :string, null: false
    remove_column :users, :password_digest
  end
end

class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :email, :username
    remove_column :users, :name
    add_index :users, :username, unique: true
  end
end

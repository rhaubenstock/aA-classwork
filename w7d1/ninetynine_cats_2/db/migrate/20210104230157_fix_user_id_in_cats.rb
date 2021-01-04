class FixUserIdInCats < ActiveRecord::Migration[5.2]
  def change
    remove_column :cats, :user_id
    add_column :cats, :user_id, :integer, null: false
    add_index :cats, :user_id
  end
end

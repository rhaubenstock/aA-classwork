class AddToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :status, :boolean, null: false, default: false
  end
end

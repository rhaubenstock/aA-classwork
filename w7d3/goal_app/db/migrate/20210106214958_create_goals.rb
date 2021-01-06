class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.boolean :public, null: false
      t.string :title, null: false
      t.text :description
      
      t.timestamps
    end

    add_index :goals, [:user_id, :title], unique: true
  end
end

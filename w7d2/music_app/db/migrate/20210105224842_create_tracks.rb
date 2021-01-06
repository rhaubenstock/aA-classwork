class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.string :lyrics
      t.integer :album_id, null: false
      t.boolean :is_bonus, null: false

      t.timestamps
    end
    add_index :tracks, [:title, :album_id], unique: true
    add_index :tracks, [:album_id, :ord], unique: true
    
  end
end

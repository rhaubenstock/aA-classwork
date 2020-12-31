class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :collection_id, null: false
      t.integer :artwork_id, null: false
      t.integer :collector_id, null: false
      t.timestamps
    end
    add_index :collections, [:collection_id, :collector_id, :artwork_id], unique: true, name: 'unique_collection'
    add_index :collections, :collector_id
    add_index :collections, :artwork_id
  end
end

class CreateMultilingualTagLinks < ActiveRecord::Migration
  def self.up
    create_table :multilingual_tag_links do |t|
      t.integer :multilingual_tag_id, null: false
      t.references :target, polymorphic: true
      t.float :distance, default: 1.0, null: false
      t.text :note
      t.integer :lock_version, default: 0, null: false
      t.timestamps null: false
    end
    add_index :multilingual_tag_links, :multilingual_tag_id
    add_index :multilingual_tag_links, [:target_id, :target_type]
  end

  def self.down
    drop_table :multilingual_tag_links
  end
end

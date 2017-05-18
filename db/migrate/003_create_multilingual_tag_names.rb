class CreateMultilingualTagNames < ActiveRecord::Migration
  def self.up
    create_table :multilingual_tag_names do |t|
      t.integer :multilingual_tag_id, null: false
      t.string :language, null: false
      t.string :name, null: false
      t.text :description
      t.integer :lock_version, default: 0, null: false
      t.timestamps null: false
    end
    add_index :multilingual_tag_names, :multilingual_tag_id
    add_index :multilingual_tag_names, :language
    add_index :multilingual_tag_names, [:multilingual_tag_id, :language], unique: true, name: "multilingual_tag_language"
  end

  def self.down
    drop_table :multilingual_tag_names
  end
end

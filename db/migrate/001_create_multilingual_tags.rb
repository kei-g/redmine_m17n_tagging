class CreateMultilingualTags < ActiveRecord::Migration
  def change
    create_table :multilingual_tags do |t|
      t.string :identifier, null: false
      t.text :note
      t.integer :project_id
      t.string :sharing, default: 'none', null: false
      t.integer :lock_version, default: 0, null: false
      t.timestamps null: false
    end
    add_index :multilingual_tags, :identifier
    add_index :multilingual_tags, :project_id
    add_index :multilingual_tags, [:identifier, :project_id], unique: true, name: "identifier_project_id"
  end
end

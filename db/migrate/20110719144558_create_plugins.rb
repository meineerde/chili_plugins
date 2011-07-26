class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :name, :null => false
      t.string :identifier, :null => false
      t.text :description
      t.text :installation_instructions
      t.string :homepage, :null => false

      t.references :author
      t.references :screenshot

      t.string :download_url
      t.string :repository_url
      t.string :repository_type

      t.timestamps
    end

    add_index :plugins, :identifier, :unique => true
  end
end

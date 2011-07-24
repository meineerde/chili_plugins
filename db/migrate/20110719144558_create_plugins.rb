class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :name
      t.string :identifier
      t.text :description
      t.string :homepage

      t.references :author

      t.string :repository_url
      t.string :repository_type

      t.timestamps
    end

    add_index :plugins, :identifier, :unique => true
  end
end

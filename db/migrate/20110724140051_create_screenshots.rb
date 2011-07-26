class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.references :plugin

      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size

      t.timestamps
    end
  end
end

class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name, :null => false
      t.string :login, :null => false

      t.timestamps
    end
  end
end

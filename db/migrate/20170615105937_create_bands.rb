class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name, :null => false
      t.string :genre, :null => false
      t.text :description, :null=>false
      t.string :zipcode
      t.integer :radius
      t.string :image
      t.string :songdemo
      t.timestamps
    end
  end
end

class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name, :null => false
      t.string :genre, :null => false
      t.text :description, :null => false
      t.string :email, :null => false, :unique => true
      t.text :url         #Band's personal web page
      t.string :songdemo1_title
      t.string :songdemo2_title
      t.string :zipcode   #Band base location
      t.integer :radius   #How far Band is willing to travel from base
      t.timestamps
    end
  end
end

class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name, :null => false
      t.string :genre, :null => false
      t.text :description, :null=>false
      t.string :email
      t.text :url         #Band's personal web page
      t.binary :image
      t.binary :songdemo1
      t.binary :songdemo2
      t.string :zipcode   #Band base location
      t.integer :radius   #How far Band is willing to travel from base
      t.timestamps
    end
  end
end

class CreateMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :musicians do |t|
      t.string :firstname, :null=>false, :limit => 50
      t.string :lastname, :null=>false,  :limit => 50
      t.string :email
      t.string :instrument, :null => false
      t.string :instrument2
      t.text :bio
      t.string :image
      t.timestamps
    end
  end
end

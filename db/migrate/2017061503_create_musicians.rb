class CreateMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :musicians do |t|
      t.string :firstname, :null=>false, :limit => 50
      t.string :lastname, :null=>false,  :limit => 50
      t.string :instrument, :null => false
      t.string :instrument2
      t.text :bio
      t.belongs_to :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end

class CreateMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :musicians do |t|
      t.string :firstname, :null=>false, :limit => 50
      t.string :lastname, :null=>false,  :limit => 50
      t.string :instrument, :null => false
      t.string :instrument2
      t.binary :image
      t.text :bio
      t.string :image
      t.belongs_to :user, foreign_key: true, index: {unique: true}
      t.timestamps
    end
  end
end

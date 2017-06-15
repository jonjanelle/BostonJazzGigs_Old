class CreateMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :musicians do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :instrument
      t.string :instrument2
      t.text :bio

      t.timestamps
    end
  end
end

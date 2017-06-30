class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.datetime :date
      t.string :location
      t.text :message
      t.timestamps
    end
  end
end

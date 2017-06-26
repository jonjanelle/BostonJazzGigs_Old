class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname, :null=>false, :limit => 50
      t.string :lastname, :null=>false,  :limit => 50
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :user_type, :null => false # m = musician, u = regular
      t.timestamps
    end
  end
end

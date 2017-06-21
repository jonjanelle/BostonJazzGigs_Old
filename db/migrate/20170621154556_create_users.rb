class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :user_type, :null => false # m = musician, r = regular
      t.timestamps
    end
  end
end

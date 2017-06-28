class AddUserRefsToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :sender_id, :integer
    add_column :messages, :receiver_id, :integer
  end
end

class AddFilesToMusicians < ActiveRecord::Migration[5.1]
  def up
    add_attachment :musicians, :image
  end

  def down
    add_attachment :musicians, :image
  end
end

class AddFilesToBands < ActiveRecord::Migration[5.1]
  def up
    add_attachment :bands, :songdemo1
    add_attachment :bands, :songdemo2
    add_attachment :bands, :image
  end

  def down
    remove_attachment :bands, :songdemo1
    remove_attachment :bands, :songdemo2
    remove_attachment :bands, :image
  end
end

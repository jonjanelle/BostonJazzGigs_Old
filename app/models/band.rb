class Band < ApplicationRecord
  has_many :band_musicians
  has_many :musicians, through: :band_musicians
  has_attached_file :songdemo1, validate_media_type: false
  has_attached_file :songdemo2, validate_media_type: false
  has_attached_file :image, validate_media_type: false

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_presence_of :name, :genre, :description, :email

  #check whether a Musician with other_id is
  #in this band.
  def in_band(other_id)
    other_id=other_id.to_i
    musicians = self.musicians
    musicians.each do |m|
      if m.id == other_id
        return true
      end
    end
    return false
  end

end

class Band < ApplicationRecord
  has_many :band_musicians
  has_many :musicians, through: :band_musicians

  validates_presence_of :name, :genre, :description, :email


  def in_band(other_id)
    musicians = self.musicians
    musicians.each do |m|
      if m.id == other_id
        return true
      end
    end
    return false
  end

end

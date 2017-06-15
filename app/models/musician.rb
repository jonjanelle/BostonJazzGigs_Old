class Musician < ApplicationRecord
  has_many :band_musicians
  has_many :bands, through: :band_musicians

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :instrument, presence: true
end

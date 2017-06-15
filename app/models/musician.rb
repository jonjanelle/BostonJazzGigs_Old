class Musician < ApplicationRecord
  has_many :band_musicians
  has_many :bands, through: :band_musician
end

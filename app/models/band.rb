class Band < ApplicationRecord
  has_many :band_musicians
  has_many :musicians, through: :band_musician
end

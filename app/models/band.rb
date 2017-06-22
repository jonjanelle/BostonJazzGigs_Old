class Band < ApplicationRecord
  has_many :band_musicians
  has_many :musicians, through: :band_musicians

  validates_presence_of :name, :genre, :description, :email
end

class Band < ApplicationRecord
  has_many :band_musicians
  has_many :musicians, through: :band_musicians

  validates :name, presence: true
  validates :genre, presence: true
  validates :description, presence: true
end

class Musician < ApplicationRecord
  belongs_to :user
  has_many :band_musicians
  has_many :bands, through: :band_musicians

  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :instrument, presence: true, length: { maximum: 50 }
end

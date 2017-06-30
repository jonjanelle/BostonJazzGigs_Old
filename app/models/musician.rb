class Musician < ApplicationRecord
  belongs_to :user
  has_many :band_musicians
  has_many :bands, through: :band_musicians
  has_attached_file :image, validate_media_type: false

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :instrument, presence: true, length: { maximum: 50 }


end

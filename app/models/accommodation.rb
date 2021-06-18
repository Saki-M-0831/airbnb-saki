class Accommodation < ApplicationRecord
  belongs_to :user
  has_many :photos

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end

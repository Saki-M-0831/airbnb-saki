class Accommodation < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def average_rating
    user_ids = bookings.pluck(:user_id)
    if reviews.where(user_id: user_ids).any?
      reviews.where(user_id: user_ids).average(:rating).round(2).to_i
    else
      return 0
    end
  end
end

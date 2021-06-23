class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation
  has_many :reviews, dependent: :destroy
end

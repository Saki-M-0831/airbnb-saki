class Photo < ApplicationRecord
  belongs_to :accommodation
  has_one_attached :image
end

class User < ApplicationRecord
  has_many :accommodations, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.image = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider
        user.skip_confirmation!
      end
    end
  end   
  
  def guest_reviews
    ids = accommodations.pluck(:id)
    @bookings = Booking.where(accommodation_id: ids)
    book_ids = @bookings.pluck(:id)
    @guest_reviews = Review.where(booking_id: book_ids) - reviews.where(booking_id: book_ids)
  end

  def host_reviews
    trip_ids = bookings.pluck(:id)
    @host_reviews = Review.where(booking_id: trip_ids) - reviews.where(booking_id: trip_ids)
  end
end

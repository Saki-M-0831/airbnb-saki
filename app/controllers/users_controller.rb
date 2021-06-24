class UsersController < ApplicationController
  def show
    @accommodations = current_user.accommodations
    ids = @accommodations.pluck(:id)
    @bookings = Booking.where(accommodation_id: ids)
    book_ids = @bookings.pluck(:id)
    @guest_reviews = Review.where(booking_id: book_ids) - current_user.reviews.where(booking_id: book_ids)

    trip_ids = Booking.where(user_id: current_user.id).pluck(:id)
    @host_reviews = Review.where(booking_id: trip_ids) - current_user.reviews.where(booking_id: trip_ids)
  end

  def edit

  end
end

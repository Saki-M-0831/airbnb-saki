class BookingsController < ApplicationController
  def create
    @booking = current_user.bookings.new(book_params)
    if @booking.save
      @booking.update(total_price: @booking.accommodation.price * (@booking.check_out - @booking.check_in))


      flash[:success] = "You have successfully booked this accommodation!!"
    else
      flash[:danger] = "You failed booking, please try again..."
    end
    redirect_back(fallback_location: request.referer)
  end

  def reservation
    ids = Accommodation.where(user_id: current_user.id).pluck(:id)
    @bookings = Booking.where(accommodation_id: ids )
  end

  def trip
    @bookings = current_user.bookings
  end

  private
  def book_params
    params.require(:booking).permit(:check_in, :check_out, :accommodation_id)
  end
end
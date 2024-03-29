class BookingsController < ApplicationController
  before_action :book_available, only: [:create]

  def create
    @booking = current_user.bookings.new(book_params)

    if @booking.save
      @booking.update(total_price: @booking.accommodation.price * (@booking.check_out - @booking.check_in))

      flash[:success] = "You have successfully booked this accommodation!!"
    else
      flash[:alert] = "You failed booking, please try again..."
    end
    redirect_to your_trips_url  
  end

  def reservation
    ids = Accommodation.where(user_id: current_user.id).pluck(:id)
    @bookings = Booking.where(accommodation_id: ids)
    @review = Review.new
  end

  def trip
    @bookings = current_user.bookings
    @review = Review.new
  end

  private
  def book_params
    params.require(:booking).permit(:check_in, :check_out, :accommodation_id)
  end

  def book_available
    @accommodation = Accommodation.find(book_params[:accommodation_id])
    if @accommodation.user == current_user

      redirect_back(fallback_location: request.referer, alert: "You cannot book your own accommodation...")
    end
  end 
end

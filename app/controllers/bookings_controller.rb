class BookingsController < ApplicationController
  def create
    @booking = Booking.new(book_params)

    if @booking.save
      flash[:success] = "You have successfully booked this accommodation!!"
    end
  end

  private
  def book_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end

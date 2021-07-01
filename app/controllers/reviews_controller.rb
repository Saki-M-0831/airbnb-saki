class ReviewsController < ApplicationController
  before_action :already_exist, only: [:create]

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      flash[:succuess] = "You succuessfully added the review!! Thank you!"
    else
      flash[:alert] = "You failed to add review, please try again..."
    end
    
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "You have successfully deleted the review"

    redirect_back(fallback_location: request.referer)
  end

  private
  def review_params
    params.require(:review).permit(:booking_id, :rating, :comment)
  end

  def already_exist
    @booking = Booking.find(review_params[:booking_id])
    if @booking.reviews.where(user_id: current_user.id).any?
      flash[:alert] = "You have reviewed this reservation already"

      redirect_back(fallback_location: request.referer)
    end
  end
end

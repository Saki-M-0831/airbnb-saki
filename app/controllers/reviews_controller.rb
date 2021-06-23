class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      flash[:succuess] = "You succuessfully added the review!! Thank you!"
    else
      flash[:danger] = "You failed to add review, please try again..."
    end
    
    redirect_back(fallback_location: request.referer)
  end

  private
  def review_params
    params.require(:review).permit(:booking_id, :rating, :comment)
  end
end

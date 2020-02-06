class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
  @place = Place.find(params[:place_id])
  @review = current_user.reviews.create(review_params)
  @review.place = @place
  @review.save
  redirect_to place_path(@place)

  end


  private



  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

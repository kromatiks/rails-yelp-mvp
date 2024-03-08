class ReviewsController < ApplicationController
  # only run set_restaurant before new and create actions
  before_action :set_restaurant, only: %i[new create]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # pass the review to the parent restaurant
    @review.restaurant = @restaurant
    @review.save
    # back to homepage
    redirect_to restaurant_path(@restaurant)
  end

  private

  # quality control with strong params
  def review_params
    params.require(:review).permit(:rating, :content)
  end

  # find the parent restaurant
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end

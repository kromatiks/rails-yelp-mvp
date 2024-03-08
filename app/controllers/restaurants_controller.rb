class RestaurantsController < ApplicationController

  # US1: see a list of all restaurant
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # by using restaurant_params, we ensure data is complete and valid
    @restaurant = Restaurant.new(restaurant_params)
    # then we save this model into the database
    @restaurant.save
    # then we redirect from this method to the mainpage
    # we pass this restaurant to the route helper
    redirect_to restaurant_path(@restaurant)
  end

  def show
    # understand why
    # what we pass to this method is an instance of restaurant
    # therefore it contains a restaurant id
    @restaurant = Restaurant.find(params[:id])
  end

  # private methods
  private

  def restaurant_params
    # first, the restaurant key must exist and point to a hash
    # then, there must be 3 valid child keys
    params.require(:restaurant).permit(:name, :address, :category)
  end

end

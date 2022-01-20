class ReviewsController < ApplicationController
 before_action :find_restaurant, only: [:create]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end


  private

 def find_restaurant
    @Restaurant = Restaurant.find(params[:restaurant_id])
 end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end 
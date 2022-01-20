class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
   # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.save
    # redirect_to restaurant_path(@restaurant)
  # end

  @restaurant = Restaurant.new(restaurant_params)
  if @restaurant.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new
  end
end


  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end 
end 


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end 

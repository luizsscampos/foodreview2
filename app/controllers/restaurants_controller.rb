class RestaurantsController < ApplicationController
  def index
  end
  
  def new
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    flash[:sucess]= 'Restaurant has been created'
    redirect_to restaurants_path
    
  end

  private
  
  # Whitelist fields
  def restaurant_params
    params.require(:restaurant).permit(:name,:description,:address1,:address2,:city,:county,:postcode)
  end
    
end

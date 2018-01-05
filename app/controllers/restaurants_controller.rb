# Restaurant Controller
class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:sucess] = 'Restaurant has been created'
      redirect_to restaurants_path
    else
      flash[:danger] = 'Restaurant has not been created'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @restaurant.update(restaurant_params)
      flash[:sucess] = 'Restaurant has been upated'
      redirect_to @restaurant
    else
      flash.now[:danger] = 'Restaurant has not been upated'
      render :edit
    end
  end

  protected

  def resource_not_found
    message = 'The restaurant you are looking for could not be found'
    flash[:warning] = message
    redirect_to root_path
  end

  private

  # Whitelist fields
  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :description,
      :address1,
      :address2,
      :city,
      :county,
      :postcode
    )
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end

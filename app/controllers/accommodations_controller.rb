class AccommodationsController < ApplicationController
  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accommo_params)
    if @accommodation.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
  end

  def index
  end

  private
  def accommo_params
    params.require(:accommodation).permit(:home_type, :room_typr, :accommodate, :bedroom_type, :bathroom_type, :price, :name, :summary, :has_tv, :has_kitchen, :has_internet, :has_heating, :has_ac, :location, :is_active)
  end
end

class AccommodationsController < ApplicationController
  before_action :require_login
  before_action :init_accommo, only: [:listing, :price, :description, :photos, :amenities, :locations, :update]

  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = current_user.accommodations.new(accommo_params)
    if @accommodation.save
      redirect_to listing_accommodation_url(@accommodation)
    else
      render "new"
    end
  end

  def listing 
  end

  def price 
  end

  def description 
  end

  def photos 
    @photos = @accommodation.photos
  end

  def amenities 
  end

  def locations 
  end

  def update
    if @accommodation.update(accommo_params)
      flash[:success] = "You successfully updated your accommodation details!!"
    else
      flash[:danger] = "You failed to updated the detail, please try again."  
    end
    redirect_back(fallback_location: request.referer) 
  end

  def index
    @accommodations = current_user.accommodations.paginate(page: params[:page], per_page: 5)
  end

  private
  def accommo_params
    params.require(:accommodation).permit(:home_type, :room_type, :accommodate, :bedroom_count, :bathroom_count, :price, :name, :summary, :has_tv, :has_kitchen, :has_internet, :has_heating, :has_ac, :location, :is_active)
  end

  def init_accommo
    @accommodation = Accommodation.find(params[:id])
  end
end

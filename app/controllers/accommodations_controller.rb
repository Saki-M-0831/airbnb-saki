class AccommodationsController < ApplicationController
  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = current_user.accommodations.new(accommo_params)
    if @accommodation.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
  end

  def index
    @accommodations = Accommodation.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
  end

  private
  def accommo_params
    params.require(:accommodation).permit(:home_type, :room_typr, :accommodate, :bedroom_type, :bathroom_type, :price, :name, :summary, :has_tv, :has_kitchen, :has_internet, :has_heating, :has_ac, :location, :is_active)
  end
end

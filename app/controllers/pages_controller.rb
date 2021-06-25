class PagesController < ApplicationController
  def home
    @accommodations = Accommodation.where(is_active: true).paginate(page: params[:page], per_page: 6)
  end

  def about
  end

  def search
    @accommodations = Accommodation.where(is_active: true).paginate(page: params[:page], per_page: 6)
  end
end

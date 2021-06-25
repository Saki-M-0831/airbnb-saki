class PagesController < ApplicationController
  def home
    @accommodations = Accommodation.all.paginate(page: params[:page], per_page: 6)
  end

  def about
  end
end

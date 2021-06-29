class PagesController < ApplicationController
  def home
    @accommodations = Accommodation.where(is_active: true).paginate(page: params[:page], per_page: 6)
  end

  def about
  end

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:location] = params[:search]
    else 
      session[:location] = ""
    end

    if session[:location] && session[:location] != ""
      @accommodations = Accommodation.where(is_active: true).near(session[:location], 5, order: "distance")    
    else
      @accommodations = Accommodation.where(is_active: true)
    end

    @search = @accommodations.ransack(params[:q])
    @accommodations = @search.result
    @accommodations_arr = @accommodations.to_a

    if params[:check_in] && params[:check_out] && !params[:check_in].empty? && !params[:check_out].empty?
      check_in = Date.parse(params[:check_in])
      check_out = Date.parse(params[:check_out])

      @accommodations.each do |accommo|
        not_avail = accommo.bookings.where(
          "(? <= check_in AND check_in <= ?)
          OR (? <= check_out AND check_out <= ?)
          OR (check_in < ? AND ? < check_out)",
          check_in, check_out,
          check_in, check_out,
          check_in, check_out
        ).limit(1)

        if not_avail.length > 0
          @accommodations_arr.delete(accommo)
        end
      end
    end
  end
end

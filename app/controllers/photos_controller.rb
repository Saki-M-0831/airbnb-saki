class PhotosController < ApplicationController
  def create
    @accommodation = Accommodation.find(params[:accommodation_id])

    if params[:images]
      params[:images].each do |img| 
        @accommodation.photos.create(image: img) 
      end

      @photos = @accommodation.photos 
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_back(fallback_location: request.referer)
  end
end

class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.new(photo_params)
    if @photo.save
      flash[:notice] = "Your photo has been saved!"
      redirect_to photo_path(@photo)
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

private
  def photo_params
    params.require(:photo).permit(:image, :user_id)
  end
end

class PlacesController < ApplicationController
   protect_from_forgery except: [:upload_photo]
    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
   @place = Place.find(params[:id])
  @review = Review.new


  end


  def new
    @place = Place.new
     @categories = Category.all
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to @place
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @place = Place.find(params[:id])
      if @place.user != current_user
     return render plain: 'Not Allowed', status: :forbidden
  end 

  end

  def update
   @place = Place.find(params[:id])
      if @place.user != current_user
     return render plain: 'Not Allowed', status: :forbidden
  end 
    @place.update_attributes(place_params)
      redirect_to place_path
  end
  

  def destroy
    @place = Place.find(params[:id])
  if @place.user != current_user
     return render plain: 'Not Allowed', status: :forbidden
  end 

  @place.destroy
  redirect_to root_path

  end

  def search
    @places = Place.search(params)
  end



  private



  def place_params
    params.require(:place).permit(:name, :description, :address, :phone, :url, :email, :zipcode, :state, :city, :category_id, :avatar, :video, photos: [])
  end
end

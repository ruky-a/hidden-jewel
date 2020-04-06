class PlacesController < ApplicationController
   protect_from_forgery except: [:upload_photo]
     before_action :is_authorised, only: [:edit, :update, :upload_photo, :delete_photo]
    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
   @place = Place.find(params[:id])
  @review = Review.new


  end


  def new
    @place = current_user.place.build
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
      if @place.user != current_user
     return render plain: 'Not Allowed', status: :forbidden
  end 

  end

  def update
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


  def upload_photo
  @place.photos.attach(params[:file])
  render json: {success: true}
  end


  def delete_photo
  @image = ActiveStorage::Attachment.find(params[:photo_id])
  @image.purge
  redirect_to edit_place_path(@place)

  end



  private

 def is_authorised
    redirect_to root_path, alert: "You do not have permission" unless current_user.id == @place.user_id
  end

  def place_params
    params.require(:place).permit(:name, :description, :address, :phone, :url, :email, :zipcode, :state, :city, :category_id, :avatar, :video )
  end
end

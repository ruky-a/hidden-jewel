class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  load_and_authorize_resource

  
  def index
   @categories = Category.limit(4)
    @places = Place.limit(3)

  end

def search 
   @categories = Category.all
  @places = Place.search(params)
  @places = Place.where(category_id: params[:category].to_i)
  @places = Place.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  @places = Place.near(params[:location], 20) if params[:location].present?
 
end


end

class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  load_and_authorize_resource

  
  def index
   @categories = Category.all
   @places = Place.all
  end

  def search
    @places = Place.search(params)
  end
end

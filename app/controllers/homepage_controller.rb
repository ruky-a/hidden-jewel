class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  load_and_authorize_resource

  
  def index
  end
end

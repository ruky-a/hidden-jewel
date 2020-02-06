class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

     include LoadAndAuthorizeResource

  before_action :authenticate_user!


end

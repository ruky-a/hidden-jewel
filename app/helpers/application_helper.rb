module ApplicationHelper
  # def avatar_url(user)
  #   if user.avatar.attached?
  #     url_for(user.avatar)
  #   else
  #     ActionController::Base.helpers.asset_path('icon_default_avatar.png')
  #   end 
  # end


      def place_cover(place)
    if place.photos.attached?
    url_for(place.photos[0])
    else
   ActionController::Base.helpers.asset_path('icon_default_image.png')
end
  end
  
end

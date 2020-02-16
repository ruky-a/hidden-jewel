module ApplicationHelper


      def place_cover(place)
    if place.photos.attached?
    url_for(place.photos[0])
    else
   ActionController::Base.helpers.asset_path('icon_default_image.png')
end
  end

  def self.active
    where(status: 1)
  end


   def picture_url(user)
    if user.picture.attached?
      url_for(user.picture)
    else
      ActionController::Base.helpers.asset_path('avatar.png')
    end 
  end
  
end

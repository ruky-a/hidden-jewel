class Place < ApplicationRecord
   geocoded_by :address
   after_validation :geocode




    has_rich_text :description
    belongs_to :user
    has_one_attached :avatar
end

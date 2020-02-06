class Place < ApplicationRecord

    belongs_to :user
    has_one_attached :avatar
    has_many :reviews
    has_many_attached :photos

    validates :name, :address, :description, :city, :state, :phone, :zipcode, presence: true

  geocoded_by :full_address
   after_validation :geocode
   


def full_address
  [address, city, state, zipcode].join(', ')

end


def self.search(params)
  places = Place.where(category_id: params[:category].to_i)
  places = places.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  places = places.near(params[:location], 20) if params[:location].present?
  places
end

end

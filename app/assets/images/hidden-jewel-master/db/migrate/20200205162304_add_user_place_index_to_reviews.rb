class AddUserPlaceIndexToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :place, index: true
    add_reference :reviews, :user, index: true
  end
end

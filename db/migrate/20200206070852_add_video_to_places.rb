class AddVideoToPlaces < ActiveRecord::Migration[6.0]
  def change
  add_column :places, :video, :string
  end
end

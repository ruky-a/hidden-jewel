class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating, default: 1

      t.timestamps
    end
  end
end

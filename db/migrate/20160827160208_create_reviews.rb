class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.string :rating
      t.belongs_to :pet, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

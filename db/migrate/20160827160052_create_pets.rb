class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :species
      t.string :fur_type
      t.string :fur_color
      t.string :gender
      t.string :age
      t.boolean :available
      t.string :breed
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

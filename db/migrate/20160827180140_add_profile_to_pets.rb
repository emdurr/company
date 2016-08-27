class AddProfileToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :profile, :text
  end
end

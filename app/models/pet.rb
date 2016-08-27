class Pet < ApplicationRecord
	belongs_to :user
	has_many :reviews
	has_attached_file :image, styles: { small: "64x64", med: "300x300", large: "600x600" }
	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

	def self.search(search)
  	where("name ILIKE ? OR breed ILIKE ?", "%#{search}%", "%#{search}%")
  end
end

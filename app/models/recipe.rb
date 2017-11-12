class Recipe < ApplicationRecord
	belongs_to :user
	has_many :directions
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	
	 has_attached_file :image, styles: { :medium => "400x400>"}
     validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

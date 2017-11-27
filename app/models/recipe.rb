class Recipe < ApplicationRecord
	belongs_to :user
	has_many :directions
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :name, :description, :image, presence: true


	accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |attr| attr[:quantity].blank?}
	accepts_nested_attributes_for :directions, :reject_if => proc { |attr| attr[:step].blank?}
	
	 has_attached_file :image, styles: { :medium => "400x400#"}
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
			
			def self.recently_added_recipes
	  		Recipe.last(4).reverse
			end
end
		


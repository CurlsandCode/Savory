class Recipe < ApplicationRecord
	belongs_to :user
	has_many :directions
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :name, :description, presence: true
	validates :name, uniqueness: true
  validates :recipe_ingredients, presence: true
	validates :directions, presence: true
	accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |attr| attr[:quantity].blank?}
  accepts_nested_attributes_for :directions, :reject_if => proc { |attr| attr[:step].blank?}
	
	has_attached_file :image, styles: { :medium => "400x400#"}, default_url: ":style/default.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
			
	def self.recently_added_recipes
	  Recipe.last(4).reverse
	end
		
		

 end



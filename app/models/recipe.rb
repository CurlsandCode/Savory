class Recipe < ApplicationRecord
	belongs_to :user
	has_many :directions
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :name, :description, :image, presence: true
  validates :name, uniqueness: true
  validates :recipe_ingredients, presence: true
	validates :directions, presence: true
	
	accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |attr| attr[:quantity].blank?}
	
	
	has_attached_file :image, styles: { :medium => "400x400#"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
			
	def self.recently_added_recipes
	  Recipe.last(4).reverse
	end
		
		
  def directions_attributes=(directions_attributes)
    directions_attributes.each do |i,direction_attr|
      if direction_attr[:step].present?
          self.directions.build(direction_attr)
        end
      end
	 end
 end


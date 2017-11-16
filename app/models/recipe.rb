class Recipe < ApplicationRecord
	belongs_to :user
	has_many :directions
	has_many :recipe_ingredients, inverse_of: :recipe
	has_many :ingredients, :through => :recipe_ingredients
	
	accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |attributes| attributes[:quantity].blank? && attributes[:name].blank? }
	
 	accepts_nested_attributes_for :directions,
  	reject_if: proc { |attributes| attributes[:step].blank? }
	

    validates :name, :description, :image, presence: true
	
	 has_attached_file :image, styles: { :medium => "400x400>"}
     validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

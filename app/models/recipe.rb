class Recipe < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :directions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, :description, :image, presence: true
  validates :name, uniqueness: true
  validates :recipe_ingredients, presence: true
  validates :directions, presence: true
  accepts_nested_attributes_for :recipe_ingredients, reject_if: proc { |attr| attr[:quantity].blank? && attr[:ingredient_attributes][:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: proc { |attr| attr[:step].blank? }, allow_destroy: true

  has_attached_file :image, styles: { medium: '400x400#' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.recently_added_recipes
    Recipe.last(4).reverse
     end

  scope :by_alphabet, -> { order(:name) }

  def next
    if next_recipe = self.class.where('id > ?', id).first
      next_recipe
    else
      Recipe.first
    end
 end
  end

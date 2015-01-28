class RecipeIngredient < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :recipes, through: :recipe_ingredients
  bleongs_to :type
end

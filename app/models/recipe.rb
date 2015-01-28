class Recipe < ActiveRecord::Base
  belongs_to :region
  belongs_to :creator, class_name: "User"

  has_many :favorites
  has_many :fans, through: :favorites, class_name: "User", source: :user

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
end

class Recipe < ActiveRecord::Base
  belongs_to :region
  belongs_to :creator, class_name: "User"

  has_many :favorites
  has_many :fans, through: :favorites, class_name: "User", source: :user

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  # def add_correct_ingredients(ary_of_strings)
  #   ingred_objs = []
  #   ary_of_strings.each do |ingred|
  #     ingred_objs << Ingredient.find_or_create_by(name: ingred.downcase)
  #   end
  #   ingred_objs.each do |ingred_obj|
  #     self.ingredients << ingred_obj
  #   end
  # end
end

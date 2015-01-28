class Recipe < ActiveRecord::Base
  belongs_to :category
  belongs_to :region
  belongs_to :creator, class_name: "User"
  has_many :favorites
  has_many :fans, through: :favorites, class_name: "User", source: :user
  has_many :ingredients, through: :recipe_ingredients

end

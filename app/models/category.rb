class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
end

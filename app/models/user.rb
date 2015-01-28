class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :created_recipes, class_name: "Recipe", foreign_key: :creator_id

  has_many :favorites
  has_many :favorite_recipes, through: :favorites, source: :recipe, class_name: "Recipe"

end

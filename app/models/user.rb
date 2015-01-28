class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :submitted_recipes, through: :recipes, foreign_key: :creator_id
  has_many :favorite_recipes, through: :favorites

end

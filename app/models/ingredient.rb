class Ingredient < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true

  belongs_to :type

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  has_many :substitutions
  has_many :substitutes, through: :substitutions
  has_many :inverse_substitutions, class_name: "Substitution", foreign_key: :substitute_id
  has_many :inverse_substitutes, through: :inverse_substitutions, source: :ingredient

  def subs
    subs = []
    subs << self.substitutes
    subs << self.inverse_substitutes
    subs.flatten!
    subs.uniq!
    return subs
  end

  def self.parse(string)
    result = []
    ingredients = string.split(",")
    ingredients.each do |ingredient|
      result << Ingredient.find_or_create_by(name: ingredient.downcase)
    end
    result
  end
end
class Type < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :ingredients
end

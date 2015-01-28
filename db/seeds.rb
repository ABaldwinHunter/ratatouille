require 'nokogiri'
require 'open-uri'
require 'date'

womens_page = Nokogiri::HTML(open("http://studiomark.com/headshots-women.html"))

women_links = womens_page.css('td img').map { |image| "http://studiomark.com/" + image['src'] }

mens_page = Nokogiri::HTML(open("http://studiomark.com/headshots-men.html"))

men_links = mens_page.css('td img').map { |image| "http://studiomark.com/" + image['src'] }

headshots = men_links + women_links

20.times {
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    location: Faker::Address.city,
    image_url: headshots.sample,
    password: "a",
    password_confirmation: "a"
    )
}

#regions

sample_regions = ["Italy", "New Zealand", "Japan", "Thailand", "Southern India", "Bologna", "New York", "Mexico", "Tuscanny", "Greece", "Sichuan", "Andalucia", "France", "Seoul"]

sample_regions.each do |region|
  Region.create(name: region)
end

#cats

sample_categories = ["dessert", "breakfast", "dinner", "appetizer", "snack", "lunch", "drink", "cocktail", "tea time", "healthy", "paleo"]

sample_categories.each do |category|
  Category.create(name: category)
end

#make ingredient types

sample_types = ["seasoning", "fruit", "vegetable", "protein", "grain", "dairy"]

sample_types.each do |type|
  Type.create(name: type)
end


#recipes

30.times {
  categories = Category.all
  recipe = Recipe.create(
    creator_id: rand(1..20),
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    rating: rand(2..5),
    region_id: rand(1..14))

  2.times {
    recipe.categories << categories.shuffle.shift
  }
}

#make ingredients

15.times {
  Ingredient.create(
    name: Faker::Lorem.word,
    type_id: rand(1..6)
    )
}

butter = Ingredient.create(name: "butter", type: Type.find_by(name: "dairy"))
margarine = Ingredient.create(name: "margarine", type: Type.find_by(name: "dairy"))
butter.substitutes << margarine

strawberry = Ingredient.create(name: "strawberry", type: Type.find_by(name: "fruit"))
blueberry = Ingredient.create(name: "blueberry", type: Type.find_by(name: "fruit"))
raspberry = Ingredient.create(name: "raspberry", type: Type.find_by(name: "fruit"))

strawberry.substitutes << raspberry
strawberry.substitutes << blueberry

#connect recipe to ingredients

recipes = Recipe.all

recipes.each do |recipe|
  ingreds = [blueberry, strawberry, raspberry, butter, margarine].slice(0..rand(1..4))
  ingreds.each do |ingred|
    recipe.ingredients << ingred
  end
end
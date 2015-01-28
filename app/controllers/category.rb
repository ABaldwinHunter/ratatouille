get '/category/all' do
  categories = Category.all.order(:name)
  erb :'category/all', locals: {categories: categories}
end

get '/category/:id' do |id|
  category = Category.find(id)
  recipes = category.recipes
  erb :'category/single', locals: {category: category, recipes: recipes}
end
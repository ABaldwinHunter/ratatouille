get '/recipe/all' do
  erb :'recipe/all'
end

get '/recipe/new' do
  erb :'recipe/new', locals: {user: current_user}
end

get '/:cat_reg/recipe/:id' do |cat_reg, id|
  recipe = Recipe.find(id)
  erb :'recipe/single', locals: {recipe: recipe}
end

post '/recipe' do
  recipe = current_user.created_recipes.create(params[:recipe])
  ingreds = Ingredient.parse(params[:ingredients])
  recipe.ingredients << ingreds
  redirect '/home'
end

get '/recipe/edit' do
  erb :'recipe/all'
end


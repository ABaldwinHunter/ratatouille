get '/recipe/all' do
  erb :'recipe/all'
end

get '/user/:id/created_recipes' do |id|
  user = User.find(id)
  recipes = user.created_recipes
  erb :'recipe/all', locals: {recipes: recipes, user: user}
end

get '/recipe/new' do
  erb :'recipe/new', locals: {user: current_user}
end

get '/cat_reg/recipe/:id' do |id|
  redirect '/recipe/#{id}'
end

get '/recipe/:id' do |id|
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


delete '/recipe/:id' do |id|
  recipe = Recipe.find(id)
  if current_user == recipe.creator
    recipe.destroy
  end
  redirect '/home'
end

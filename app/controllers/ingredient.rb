get '/ingredient/all' do
  ingredients = Ingredient.all.order(:name)
  erb :'ingredient/all', locals: {ingredients: ingredients}
end

get '/ingredient/new' do
  erb :'ingredient/all'
end

get '/ingredient/:id' do |id|
  ingredient = Ingredient.find(id)
  recipes = ingredient.recipes
  subs = ingredient.subs
  erb :'ingredient/single', locals: {ingredient: ingredient, recipes: recipes, subs: subs}
end

get '/ingredient/:id/recipes' do |id|
  recipes = Ingredient.find(id).recipes
end

get '/ingredient/:id/substitutes' do |id|
  ingredient = Ingredient.find(id)
  subs = ingredient.subs
  erb :'ingredient/subs', locals: {ingredient: ingredient, subs: subs}
end

post '/ingredient' do
  Ingredient.find_or_create_by(name: params[:ingredient][:name], type: params[:ingredient][:type])
  redirect '/ingredient/all'
end

get '/ingredient/edit' do
  erb :'ingredient/all'
end



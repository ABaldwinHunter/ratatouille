get '/favorites' do
  user = current_user
  recipes = user.favorite_recipes
  erb :'favorite/all', locals: {recipes: recipes}
end

post '/favorite/:id' do |id|
  user = current_user
  recipe = Recipe.find(id)
  unless user.favorite_recipes.include?(recipe)
    Favorite.create(user: user, recipe: recipe)
  end
  redirect '/home'
end


delete '/favorite_recipe/:id' do |id|
  fav = Favorite.where(["user_id = ? recipe_id = ?", current_user.id, id])
  fav.destroy
  redirect '/home'
end
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

  if request.xhr?
    return
  else
    redirect '/home'
  end
end

delete '/favorite/:id' do |id|
  fav = Favorite.where(["user_id = ? AND recipe_id = ?", current_user.id, id.to_i])[0]
  fav.destroy
  if request.xhr?
    return
  else
    redirect '/home'
  end
end
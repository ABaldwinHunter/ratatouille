get '/favorites' do
  user = current_user
  recipes = user.favorite_recipes
  erb :'favorite/all', locals: {recipes: recipes}
end

delete '/favorite_recipe/:id' do |id|
  fav = Favorite.where(["user_id = ? recipe_id = ?", current_user.id, id])
  fav.destroy
  redirect '/home'
end
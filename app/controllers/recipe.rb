get '/recipe/all' do
  erb :'recipe/all'
end

get '/recipe/new' do
  erb :'recipe/all'
end

get '/:cat_reg/recipe/:id' do |cat_reg, id|
  recipe = Recipe.find(id)
  erb :'recipe/single', locals: {recipe: recipe}
end

post '/recipe' do
end

get '/recipe/edit' do
  erb :'recipe/all'
end


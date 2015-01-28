get '/region/all' do
  regions = Region.all.order(:name)
  erb :'region/all', locals: {regions: regions}
end

get '/region/:id' do |id|
  region = Region.find(id)
  recipes = region.recipes
  erb :'region/single', locals: {region: region, recipes: recipes}
end


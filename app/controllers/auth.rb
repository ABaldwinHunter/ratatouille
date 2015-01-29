get '/' do
  if current_user
    erb :'auth/home'
  end
  erb :index
end

get '/login' do
  if request.xhr?
    return erb :'auth/login', layout: false
  else
    erb :'auth/login'
  end
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  user.try(:authenticate, params[:user][:password])
  session[:user_id] = user.id

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/home"
  else
    set_error('Login Failed, Please Try Again')
    redirect '/login'
  end
end

get '/signup' do
  if request.xhr?
    erb :'auth/signup', layout: false
  else
    erb :'auth/signup'
  end
end

post '/signup' do
  p session[:error]
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    erb :'auth/home'
  else
    present_errors(user.errors.messages)
    redirect "/signup"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/home' do
  erb :'auth/home'
end

get '/profile/:id' do |id|
  user = User.find(id)
  erb :'auth/profile', locals: {user: user}
end

get '/pofile/edit' do
  erb :'auth/edit_profile', locals: {user: current_user}
end

put '/pofile' do
  current_user.update(params[:user])
  redirect '/home'
end
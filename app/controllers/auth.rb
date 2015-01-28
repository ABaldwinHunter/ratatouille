get '/' do
  if current_user
    erb :'auth/home'
  end
  erb :index
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  user.try(:authenticate, params[:user][:password])
  session[:user_id] = user.id

  if request.xhr?
    erb :'auth/home' #locals: {user: user}, layout: false
  else
    set_error('Login Failed, Please Try Again')
    redirect "/"
  end
end

get '/signup' do
  erb :'auth/signup'
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

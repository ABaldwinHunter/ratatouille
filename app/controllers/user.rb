get '/profile/edit' do
  erb :'auth/edit_profile', locals: {user: current_user}
end
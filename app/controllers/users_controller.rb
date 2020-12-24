class UsersController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts session
      redirect "users/#{@user.id}"
    else

    end
  end

  get '/signup' do
    erb :signup
  end

  post '/users' do
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
    @user = User.create(params)
    redirect "/users/#{@user.id}"
      else
      # not valid
    end

  end

  get '/users/:id' do
    "This is the user show page"
  end

end
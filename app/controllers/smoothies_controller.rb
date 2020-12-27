class SmoothiesController < ApplicationController

  get '/smoothies/new' do
    erb :'/smoothies/new'
  end

  post '/smoothies' do
    if !logged_in?
      redirect '/'
    end

    if params[:content] !=""
      @smoothie = Smoothie.create(content: params[:content], user_id: current_user.id)
      redirect "/smoothies/#{@smoothie.id}"
    else
      redirect "/smoothies/new"
    end
  end
end

#   get '/smoothies/:id' do
#     @smoothie = Smoothie.find(params[:id])
#     erb :"/smoothies/show"
#   end

#   get '/smoothies/:id/edit' do 
#     "Hello World"
#   end
# end
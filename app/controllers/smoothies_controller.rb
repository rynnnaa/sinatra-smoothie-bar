class SmoothiesController < ApplicationController

  get '/smoothies/new' do
    erb :"/smoothies/new"
  end

  post '/smoothies/new' do
    erb :"/smoothies/new"
  end
end
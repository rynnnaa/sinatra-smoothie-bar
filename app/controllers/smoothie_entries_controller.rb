class SmoothieEntriesController < ApplicationController

  get '/smoothie_entries/new' do
    erb :'/smoothie_entries/new'
  end

  post '/smoothie_entries' do
    if !logged_in?
      redirect '/'
    end

    if params[:content] != ""
      @smoothie_entry = SmoothieEntry.create(params)
      redirect "/smoothie_entries/#{@smoothie_entry.id}"
    else
      redirect '/smoothie_entries/new'
    end
  end

  get '/smoothies/:id' do
    @smoothie = Smoothie.find(params[:id])
    erb :"/smoothie_entries/show"
  end

  get '/smoothies/:id/edit' do 
    "Hello World"
  end
end
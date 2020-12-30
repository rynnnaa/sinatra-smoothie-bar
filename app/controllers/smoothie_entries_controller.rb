class SmoothieEntriesController < ApplicationController

  get '/smoothie_entries/new' do
    erb :'/smoothie_entries/new'
  end

  post '/smoothie_entries' do
    if logged_in?
      redirect '/'
    end

    if params[:content] != ""
      @smoothie_entry = SmoothieEntry.create(params)
      redirect "/smoothie_entries/#{@smoothie_entry.id}"
    else
      redirect '/smoothie_entries/new'
    end
  end

  get '/smoothie_entries/:id' do
    @smoothie_entry = SmoothieEntry.find(params[:id])
    erb :"/smoothie_entries/show"
  end

  get '/smoothie_entries/:id/edit' do 
    @smoothie_entry = SmoothieEntry.find(params[:id])
    erb :'smoothie_entries/edit'
  end

  patch '/smoothie_entries/:id' do
    @smoothie_entry = SmoothieEntry.find(params[:id])
    @smoothie_entry.update(content: params[:content])
    redirect "/smoothie_entries/#{@smoothie_entry.id}"
  end

end

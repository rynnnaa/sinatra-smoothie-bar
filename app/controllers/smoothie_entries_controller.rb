class SmoothieEntriesController < ApplicationController


  get '/smoothie_entries' do
    @smoothie_entries = SmoothieEntry.all
    erb :'smoothie_entries/index'
  end

  get '/smoothie_entries/new' do
    if !logged_in?
      redirect '/'
    end
    erb :'/smoothie_entries/new'
  end

  post '/smoothie_entries' do
    if !logged_in?
      redirect '/'
    end

    if params[:content] != ""
      flash[:message] = 'Success!'
      @smoothie_entry = SmoothieEntry.create(content: params[:content], user_id: current_user.id)
      redirect "/smoothie_entries/#{@smoothie_entry.id}"
    else
      flash[:errors] = 'Unsuccessful. Please try again.'
      redirect '/smoothie_entries/new'
    end
  end

  get '/smoothie_entries/my_entries' do
    @smoothie_entries = current_user.smoothie_entries
    erb :"/smoothie_entries/my_entries"
  end

  get '/smoothie_entries/:id' do
    @smoothie_entry = SmoothieEntry.find(params[:id])
    erb :"/smoothie_entries/show"
  end

  get '/smoothie_entries/:id/edit' do
    set_smoothie_entry
    if logged_in?
      if @smoothie_entry.user_id == current_user.id
        erb :'smoothie_entries/edit'
      else
        redirect "users/#{current_user.id}"
      end
    else 
      redirect '/'
    end
  end

  patch '/smoothie_entries/:id' do
    set_smoothie_entry
    if logged_in?
      if @smoothie_entry.user == current_user && params[:content] != ""
        @smoothie_entry.update(content: params[:content])
        redirect "/smoothie_entries/#{@smoothie_entry.id}"
      else
        redirect '/users/#{current_user.id}'
      end
    else
      redirect '/'
    end
  end

  delete '/smoothie_entries/:id' do
    set_smoothie_entry
    if authorized_to_edit?(@smoothie_entry)
      @smoothie_entry.destroy
      redirect '/smoothie_entries'
    else
      redirect '/smoothie_entries'
    end
  end

  private
  def set_smoothie_entry
    @smoothie_entry = SmoothieEntry.find(params[:id])
  end
end
class PokemonsController < ApplicationController

  #varifying user is logged into the correct account
  get "/pokemon" do
    if logged_in?
      @trainer = current_user
      @pokemon = Pokemon.all 
    else
      redirect to "/login"
    end
    erb :"/index"
  end

  #how you get to pokemon new
  get "/pokemon/new" do
    if logged_in?
      erb :"/pokemon/new"
    else
      redirect to '/login'
    end
  end

  #post for the pokemon/new saves new pokemon created
  post '/pokemon' do 
    if !params[:name].blank?
      @pokemon = Pokemon.new(name: params[:name], pokemon_type: params[:type])
      @pokemon.trainer = current_user
      @pokemon.save
      redirect to "/pokemon/#{@pokemon.id}"
    else
      redirect to "/pokemon/new"
    end
  end

  #effects the ability to reach pokemon/show view
  get '/pokemon/:id' do 
    @pokemon = Pokemon.find(params[:id])
      if logged_in?
        erb :'pokemon/show'
      else
        redirect to '/login'
      end
  end
  
  #route to edit pokemon
  get '/pokemon/:id/edit' do 
    if logged_in? 
      @pokemon = Pokemon.find_by_id(params[:id])
      erb :'pokemon/edit'
    else
      redirect to '/login'
    end
  end

  #patch needed to update pokemon data
  patch '/pokemon/:id' do 
    if logged_in?
      Pokemon.find(params[:id]).tap do |pokemon|
        pokemon.update(name: params[:name], pokemon_type: params[:type]) if current_user == pokemon.trainer 
        redirect "/pokemon/#{pokemon.id}"
      end
    else
      redirect '/login'
    end
  end

  #basic delete also making sure correct user is logged in to prevent other users from deleting pokemon that are not theirs
  delete '/pokemon/:id' do 
    @pokemon = Pokemon.find(params[:id])
      if logged_in? && @pokemon.trainer == current_user 
        @pokemon.destroy
          redirect to "/trainers/#{current_user.id}"
      else 
        redirect to '/login'
      end
  end



end



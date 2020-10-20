class PokemonsController < ApplicationController

  
  get "/pokemon" do
    if logged_in?
      @trainer = current_user
      @pokemon = Pokemon.all 
    else
      redirect to "/login"
    end
    erb :"/pokemon/index"
  end

  get "/pokemon/new" do
    if logged_in?
      erb :"/pokemon/new"
    else
      redirect to '/login'
    end
  end

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

  get '/pokemon/:id' do 
    @pokemon = Pokemon.find(params[:id])
      if logged_in?
        erb :'pokemon/show'
      else
        redirect to '/login'
      end
  end
  

  get '/pokemon/:id/edit' do 
    if logged_in? 
      @pokemon = Pokemon.find_by_id(params[:id])
      erb :'pokemon/edit'
    else
      redirect to '/login'
    end
  end

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



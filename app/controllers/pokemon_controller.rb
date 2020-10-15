class PokemonController < ApplicationController

  
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
      @pokemon = Pokemon.new(name: params[:name])
      @pokemon.trainer = current_user
      @pokemon.save
      redirect to "/pokemon/#{@pokemon.id}"
    else
      redirect to "/pokemon/new"
    end
  end


  # # POST: /pokemon
  # post "/pokemon" do
  #   redirect "/pokemon"
  # end

  # # GET: /pokemon/5
  # get "/pokemon/:id" do
  #   erb :"/pokemon/show"
  # end

  # # GET: /pokemon/5/edit
  # get "/pokemon/:id/edit" do
  #   erb :"/pokemon/edit"
  # end

  # # PATCH: /pokemon/5
  # patch "/pokemon/:id" do
  #   redirect "/pokemon/:id"
  # end

  # # DELETE: /pokemon/5/delete
  # delete "/pokemon/:id/delete" do
  #   redirect "/pokemon"
  # end
end

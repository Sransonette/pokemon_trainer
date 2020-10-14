class PokemonController < ApplicationController

  # GET: /pokemon
  get "/pokemon" do
    erb :"/pokemon/index.html"
  end

  # GET: /pokemon/new
  get "/pokemon/new" do
    erb :"/pokemon/new.html"
  end

  # POST: /pokemon
  post "/pokemon" do
    redirect "/pokemon"
  end

  # GET: /pokemon/5
  get "/pokemon/:id" do
    erb :"/pokemon/show.html"
  end

  # GET: /pokemon/5/edit
  get "/pokemon/:id/edit" do
    erb :"/pokemon/edit.html"
  end

  # PATCH: /pokemon/5
  patch "/pokemon/:id" do
    redirect "/pokemon/:id"
  end

  # DELETE: /pokemon/5/delete
  delete "/pokemon/:id/delete" do
    redirect "/pokemon"
  end
end

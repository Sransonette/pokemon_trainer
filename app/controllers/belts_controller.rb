class BeltsController < ApplicationController

  # GET: /belts
  get "/belts" do
    erb :"/belts/index.html"
  end

  # GET: /belts/new
  get "/belts/new" do
    erb :"/belts/new.html"
  end

  # POST: /belts
  post "/belts" do
    redirect "/belts"
  end

  # GET: /belts/5
  get "/belts/:id" do
    erb :"/belts/show.html"
  end

  # GET: /belts/5/edit
  get "/belts/:id/edit" do
    erb :"/belts/edit.html"
  end

  # PATCH: /belts/5
  patch "/belts/:id" do
    redirect "/belts/:id"
  end

  # DELETE: /belts/5/delete
  delete "/belts/:id/delete" do
    redirect "/belts"
  end
end

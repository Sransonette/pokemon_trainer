class TrainersController < ApplicationController

  # GET: /trainers
  get "/trainers" do
    erb :"/trainers/index.html"
  end

  # GET: /trainers/new
  get "/trainers/new" do
    erb :"/trainers/new.html"
  end

  # POST: /trainers
  post "/trainers" do
    redirect "/trainers"
  end

  # GET: /trainers/5
  get "/trainers/:id" do
    erb :"/trainers/show.html"
  end

  # GET: /trainers/5/edit
  get "/trainers/:id/edit" do
    erb :"/trainers/edit.html"
  end

  # PATCH: /trainers/5
  patch "/trainers/:id" do
    redirect "/trainers/:id"
  end

  # DELETE: /trainers/5/delete
  delete "/trainers/:id/delete" do
    redirect "/trainers"
  end
end
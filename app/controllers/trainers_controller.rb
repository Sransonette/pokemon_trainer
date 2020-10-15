class TrainersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to "/show"
    else 
      erb :"/trainers/create_t"
    end
  end

  post '/signup' do 
    @trainer = Trainer.new(params)
    if @trainer.username == "" || @trainer.email == "" || @trainer.password == ""
      redirect to "/signup"
    elsif @trainer.save
      session[:id] = @trainer.id
      redirect to "/show"
    else
      redirect to "/signup"
    end
  end

  get '/login' do 
    if logged_in?
      current_user
      redirect to "/show"
    else
      erb :'/trainers/login'
    end
  end

  post '/login' do 
    @trainer = Trainer.find_by(:username => params[:username])

    if @trainer && @trainer.authenticate(params[:password])
      session[:id] = @trainer.id 
      redirect to "/show"
    else
      redirect to "/login"
    end
  end

  get '/logout' do 
    if logged_in?
      session.clear
    end
    redirect to "/"
  end

  get '/show' do 
    @trainer = current_user
    erb :'/trainers/show'
  end

#   # GET: /trainers/create_t
#   get "/trainers/create_t" do
#     erb :"/trainers/create_t"
#   end

#   # POST: /trainers
#   post "/trainers" do
#     redirect "/trainers"
#   end

#   # GET: /trainers/5
#   get "/trainers/:id" do
#     erb :"/trainers/show"
#   end

#   # GET: /trainers/5/edit
#   get "/trainers/:id/edit" do
#     erb :"/trainers/edit"
#   end

#   # PATCH: /trainers/5
#   patch "/trainers/:id" do
#     redirect "/trainers/:id"
#   end

#   # DELETE: /trainers/5/delete
#   delete "/trainers/:id/delete" do
#     redirect "/trainers"
#   end
end
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
      redirect to "/trainer/#{current_user.id}"
    else
      erb :'/trainers/login'
    end
  end

  post '/login' do 
    @trainer = Trainer.find_by(:username => params[:username])

    if @trainer && @trainer.authenticate(params[:password])
      session[:id] = @trainer.id 
      redirect to "/trainer/#{@trainer.id}"
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

  get '/trainer/:id' do 
    @trainer = Trainer.find(params[:id])
    erb :'/trainers/show'
  end

  



end
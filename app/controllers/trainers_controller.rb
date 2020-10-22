class TrainersController < ApplicationController

  #signup route
  get '/signup' do
    if logged_in?
      redirect to "/trainers/#{current_user.id}"
    else 
      erb :"/trainers/create_t"
    end
  end

  #post route requiring that all forms be filled to create a new user
  post '/signup' do 
    @trainer = Trainer.new(params)
    if @trainer.username == "" || @trainer.email == "" || @trainer.password == ""
      flash[:errors] = "All forms must be filled to create a Pokemon Trainer. Please try again."
      redirect to "/signup"
    elsif @trainer.save
      session[:id] = @trainer.id
      redirect to "/trainers/#{@trainer.id}"
    else
      flash[:errors] = "All forms must be filled to create a Pokemon trainer. Please try again."
      redirect to "/signup"
    end
  end

  #get route to login
  get '/login' do 
    if logged_in?
      redirect to "/trainers/#{current_user.id}"
    else
      erb :'/trainers/login'
    end
  end

  #post is authenticating that the user name and password match using .authenticate
  post '/login' do 
    @trainer = Trainer.find_by(:username => params[:username])

    if @trainer && @trainer.authenticate(params[:password])
      session[:id] = @trainer.id 
      redirect to "/trainers/#{@trainer.id}"
    else

      flash[:errors] = "Invalid Username or Password. Please try again."
      redirect to "/login"
    end
  end

  #logout route clearing user session
  get '/logout' do 
    if logged_in?
      session.clear
    end
    redirect to "/"
  end

  #get route to the show page
  get '/trainers/:id' do 
    @trainer = Trainer.find(params[:id])
    erb :'/trainers/show'
  end

  



end
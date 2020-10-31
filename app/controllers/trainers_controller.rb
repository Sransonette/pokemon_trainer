class TrainersController < ApplicationController

  
  get '/signup' do
    if logged_in?
      redirect to "/trainers/#{current_user.id}"
    else 
      erb :"/trainers/create_t"
    end
  end

  
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

  
    get '/login' do 
      if logged_in?
        redirect to "/trainers/#{current_user.id}"
      else
        erb :'/trainers/login'
      end
    end

  
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

  
  get '/logout' do 
    if logged_in?
      session.clear
    end
    redirect to "/"
  end

  
  get '/trainers/:id' do 
    @trainer = Trainer.find(params[:id])
    if @trainer == current_user
      erb :'/trainers/show'
    else
      flash[:errors] = "You are not authoroized to view this page"
      redirect to "/login"
    end
  end


end
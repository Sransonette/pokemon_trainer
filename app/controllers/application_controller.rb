require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :method_override
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  #root route
  get "/" do
    erb :index
  end

  helpers do 

    #current user helper checking if session is not nil sets @trainer variable to the session id
    def current_user
      if session[:id] !=nil
        @trainer = Trainer.find(session[:id])
      end
    end

    #logged_in? helper method setting the current user method to a boolean so I can check if the current user is logged in throughout the app
    def logged_in?
      current_user ? true : false
    end

    
  end



end

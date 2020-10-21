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

  get "/" do
    erb :index
  end

  helpers do 

    def current_user
      if session[:id] !=nil
        @trainer = Trainer.find(session[:id])
      end
    end

    def logged_in?
      current_user ? true : false
    end

    
  end



end


class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions unless test?
        set :session_secret, "secretwhiskey"
    end

    get '/' do 
       session[:greeting] = "Hello World!"
      
    end

    get '/failure' do 
     
        erb :'/failure'
    end

    helpers do 
        def logged_in?
            !!current_user
        end

        def current_user 
            @current_user || User.find_by(:email => session[:email]) if session[:email]
        end

        def login(username, password)
            session[:username] = username
            user = User.find_by(:username => username)
            if user && user.authenticate(password)
                session[:id] = user.id
            else 
                redirect '/login'
            end
        end

        def logout
            session.clear
        end

         private 

    def user_params 
        {username: params[:username], password: params[:password] }
    end
    end

end
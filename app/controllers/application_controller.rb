
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
            @current_user || User.find_by(:username => session[:username]) if session[:username]
        end

        def redirect_if_not_logged_in 
            unless logged_in?
                redirect '/login'
            end
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
        {username: params[:username], password: params[:password]}
    end

    def whiskey_params 
        {name: params[:name], description: params[:description], user: current_user }
    end
    end

end

class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions unless test?
        set :session_secret, "secretwhiskey"
    end

    get '/' do
        erb :index
      end

    get '/failure' do 
     
        erb :'/failure'
    end

    helpers do 
        def logged_in?
            !!current_user
        end

        def current_user 
            @current_user ||= User.find_by(:username => session[:username]) 
        end

        def redirect_if_not_logged_in 
            unless logged_in?
                redirect '/login'
            end
        end
            
        def can_edit(object)
            if current_user.id == object.user.id   
                
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
    
        delete '/whiskeys/:id' do
            @whiskey = Whiskey.find(params["id"])
            @whiskey.destroy
            erb :'/delete'
          end

          delete '/distilleries/:id' do
            @distillery = Distillery.find(params["id"])
            @distillery.destroy
            erb :'distilleries/delete'
          end

         private 

    def user_params 
        {username: params[:username], password: params[:password]}
    end

    def whiskey_params 
        {name: params[:name], description: params[:description], distillery_id: params[:distillery_id], user: current_user }
    end
    end

end
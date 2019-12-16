class SessionsController < ApplicationController 
    get '/login' do 
        erb :"sessions/login"
    end

    post '/sessions' do 
        params[:email]
        # login(params[:email], params[:password])
        redirect to '/whiskeys'
    end

    get '/logout' do
        logout
        redirect '/'
    end
end
require 'byebug'
class UsersController < ApplicationController 
    get '/signup' do 
        erb :"users/new"
    end

    post '/signup' do 
        @user = User.new(user_params)
        if @user.save 
            redirect '/login'
        else 
            @errors = ["Signup failed"]
            erb :"/failure"
        end
        
    end
    
end
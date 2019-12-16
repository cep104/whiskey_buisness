require 'byebug'
class UsersController < ApplicationController 
    get '/signup' do 
        erb :"users/new"
    end

    post '/signup' do 
        @errors = ["not yet implemented"]
        # @user = User.new 
        # @user.email = params[:email]
        # @user.password = params[:password]
        # if @user.save 
        #     redirect '/login'
        # else 
        #     erb :"users/new"
        # end
        erb :'/failure'
    end
end
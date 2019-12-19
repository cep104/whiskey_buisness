class DistilleriesController < ApplicationController 
    get '/distilleries' do 
        redirect_if_not_logged_in 
        @distilleries = current_user.distilleries
        
            erb :"distilleries/index"
    end

    get '/distilleries/new' do
        redirect_if_not_logged_in 
       
            erb :"distilleries/new"
  
    end

    get '/distilleries/:id' do 
        redirect_if_not_logged_in 
        
        @distillery = Distillery.find(params[:id])
        if  @distillery
        erb :'distilleries/show'
        else 
        @errors = ["Distillery does not exist"]
        redirect '/failure'
        end
    end

    post '/distilleries' do 
        redirect_if_not_logged_in 
        distillery = Distillery.new(distillery_params)
        if distillery.save && distillery.name != ""
            redirect '/distilleries'
        else
        @errors = ["could not make new distillery"]
        erb :failure
        end

       
    end

    private 

    def distillery_params 
        {name: params[:name], about: params[:about], user: current_user }
    end
end
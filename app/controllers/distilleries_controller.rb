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

    get '/distilleries/:id/edit' do 
        redirect_if_not_logged_in 
        set_distillery

        erb :'/distilleries/edit'

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

    patch '/distilleries/:id' do 
        redirect_if_not_logged_in 
        set_distillery
       if @distillery.update(distillery_params)
        redirect '/distilleries'
       else
        # @whiskey = Whiskey.find_by(id: params[:id])
        @errors = ["could not update"]
        erb :failure
       end
    end

    private 

    def distillery_params 
        {name: params[:name], about: params[:about], user: current_user }
    end

    def set_distillery
        @distillery = Distillery.find_by(id: params[:id])
        unless @distillery
            @errors = ["invalid whiskey id"]
            redirect '/failure'
        end
    end
end
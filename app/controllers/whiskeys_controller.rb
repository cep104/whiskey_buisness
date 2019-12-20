class WhiskeysController < ApplicationController 
    get '/whiskeys' do 
        redirect_if_not_logged_in 
        @whiskeys = current_user.whiskeys
        
            erb :"whiskeys/index"
       
    end

    get '/whiskeys/new' do
        redirect_if_not_logged_in 
       
            erb :"whiskeys/new"
  
    end

    post '/whiskeys' do 
        redirect_if_not_logged_in 
        whiskey = Whiskey.new(whiskey_params)
        if whiskey.save && whiskey != ""
            redirect '/whiskeys'
        else
        @errors = ["could not make new whiskey"]
        erb :failure
        end
    end

    get '/whiskeys/:id' do 
        redirect_if_not_logged_in 
        @whiskey = Whiskey.find(params[:id])
        erb :'whiskeys/show'
    end

    get '/whiskeys/:id/edit' do 
        redirect_if_not_logged_in 
        set_whiskey 

        erb :'/whiskeys/edit'

    end
    
   
    patch '/whiskeys/:id' do 
        redirect_if_not_logged_in 
        set_whiskey 
       if @whiskey.update(whiskey_params)
        redirect '/whiskeys'
       else
        # @whiskey = Whiskey.find_by(id: params[:id])
        @errors = ["could not update"]
        erb :failure
    end

    
      
end

    private 

    def set_whiskey 
        @whiskey = Whiskey.find_by(id: params[:id])
        unless @whiskey 
            @errors = ["invalid whiskey id"]
            redirect '/'
        end
    end

end 
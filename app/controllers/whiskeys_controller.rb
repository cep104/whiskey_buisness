class WhiskeysController < ApplicationController 
    get '/whiskeys' do 
        @whiskeys = Whiskey.all
        if !logged_in?
            erb :"whiskeys/index"
        else
        redirect to '/'
        end
    end

    get '/whiskeys/new' do
        # if !logged_in?
        #     redirect '/login'
        # else
            erb :"whiskeys/new"
    #   end
    end

    post '/whiskeys' do 
        whiskey = Whiskey.new(whiskey_params)
        if whiskey.save 
            redirect '/whiskeys'
        else
        @errors = [params.to_s]
        erb :failure
        end
    end

    get '/whiskeys/:id' do 
        @whiskey = Whiskey.find(params[:id])
        erb :'whiskeys/show'
    end

    get '/whiskeys/:id/edit' do 
        set_whiskey 

        erb :'/whiskeys/edit'

    end
    

    patch '/whiskeys/:id' do 
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
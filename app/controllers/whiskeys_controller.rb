class WhiskeysController < ApplicationController 
    get '/whiskeys' do 
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

    get '/whiskeys/:id/edit' do 
        if !logged_in?
            redirect '/login'
        else
            whiskey = Whiskey.find(params[:id])
            if current_user.whiskeys.find_by(params[:id])
            "An edit whiskey form #{current_user.id} is editing #{whiskey.id}"
            else 
                redirect '/whiskeys'
            end
        end   
    end
end 
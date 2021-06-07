require './config/environment'

class UserController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(username: params[:username], password: params[:password])
        if user.username.blank? || user.password.blank? || User.find_by_username(params["username"])
        redirect to '/signup'
        else
            user.save
            #binding.pry
            session[:user_id] = user.id
            redirect to '/cars'
        end
    end

    # User signs up and doesn't redirect to '/cars'

    post '/logout' do
        session.clear
        redirect to '/'
    end


  

end

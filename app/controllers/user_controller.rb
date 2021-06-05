require './config/environment'

class UserController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(username: params[:username], password: params[:password])
        if user.username.blank? || user.password.blank? || User.find_by_username(params["username"])
        redirect to 'users/signup'
        else
            redirect to '/inventory'
        end
    end

  

end

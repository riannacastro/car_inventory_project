require './config/environment'

class CarController < ApplicationController

    get '/inventory' do
        erb :'cars/index'
    end

end

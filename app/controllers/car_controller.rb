require './config/environment'

class CarController < ApplicationController

    get '/cars' do
        @cars = Car.all 
        erb :'cars/index'
    end

    get '/cars/:id' do
        @car = Car.find(params[:id])

        erb :'cars/show'
    end
    
    get '/cars/new' do
    end

    get '/cars/:id/edit' do
    end

    post '/cars' do
     end

    patch '/cars/:id' do
     end

    delete '/cars/:id' do
     end



end

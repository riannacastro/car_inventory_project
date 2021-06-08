require './config/environment'

class CarController < ApplicationController

    get '/cars' do
        @cars = Car.all 
        erb :'cars/index'
    end


    get '/cars/new' do
        erb :'cars/new'
    end


    get '/cars/:id' do
        @car = Car.find(params[:id])

        erb :'cars/show'
    end
    

    get '/cars/:id/edit' do
        @car = Car.find(params[:id])
    end

    post '/cars' do
       @car = Car.new(params)
       @car.save
    end

    patch '/cars/:id' do
        @car = Car.find(params[:id])
    end

    delete '/cars/:id' do
        @car = Car.find(params[:id])
    end



end

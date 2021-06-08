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
        erb :'cars/edit'
    end

    post '/cars' do
       car = Car.new(params)
       car = Car.all
       car.save
       redirect :'/cars'
    end

    patch '/cars/:id' do
        @car = Car.find(params[:id])
        @car.update(params["car"])
        redirect :"cars/#{@car.id}"
    end

    delete '/cars/:id' do
        @car = Car.find(params[:id])
    end



end

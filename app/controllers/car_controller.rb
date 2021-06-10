require './config/environment'

class CarController < ApplicationController

    get '/cars' do
        if !logged_in?
            redirect to '/login'
        end
        @cars = Car.all 
        erb :'cars/index'
    end


    get '/cars/new' do
        if !logged_in?
            redirect to '/login'
        end

        erb :'cars/new'
    end


    get '/cars/:id' do
        if !logged_in?
            redirect to '/login'
        end
        @car = Car.find(params[:id])

        erb :'cars/show'
    end
    

    get '/cars/:id/edit' do
        if !logged_in?
            redirect to '/login'
        end
        @car = Car.find(params[:id])
        erb :'cars/edit'
    end

    post '/cars' do
        if !logged_in?
            redirect to '/login'
        end
       car = Car.new(params)
       car.user = current_user
       car.save
       redirect :'/cars'
    end

    patch '/cars/:id' do
        if !logged_in?
            redirect to '/login'
        end
        @car = Car.find(params[:id])
        @car.update(params["car"])
        redirect :"cars/#{@car.id}"
    end

    delete '/cars/:id' do
        if !logged_in?
            redirect to '/login'
        end
        @car = Car.find(params[:id])
        @car.destroy
        redirect :"/cars"
    end



end

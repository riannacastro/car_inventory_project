require './config/environment'

class CarController < ApplicationController

    get '/cars' do
        redirect_if_not_logged_in
        @cars = Car.all 
        erb :'cars/index'
    end


    get '/cars/new' do
        redirect_if_not_logged_in
        erb :'cars/new'
    end


    get '/cars/:id' do
        redirect_if_not_logged_in
        @car = Car.find(params[:id])

        erb :'cars/show'
    end
    

    get '/cars/:id/edit' do
        redirect_if_not_logged_in
        @car = Car.find(params[:id])
        redirect_if_not_authorized
        erb :'cars/edit'
    end

    post '/cars' do
        redirect_if_not_logged_in
       car = Car.new(params)
       car.user = current_user
       car.save
       redirect :'/cars'
    end

    patch '/cars/:id' do
        redirect_if_not_logged_in
        @car = Car.find(params[:id])
        redirect_if_not_authorized
        @car.update(params["car"])
        redirect :"cars/#{@car.id}"
    end

    delete '/cars/:id' do
        redirect_if_not_logged_in
        @car = Car.find(params[:id])
        redirect_if_not_authorized
        @car.destroy
        redirect :"/cars"
    end

    private
    def redirect_if_not_authorized
        if @car.user != current_user
            redirect '/cars'
        end
    end



end

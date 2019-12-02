class CarsController < ApplicationController

    def index
        @cars = Car.all
    end

    def show
        @car = Car.find(params[:id])
    end


    def new
        @car = @car_category.cars.new()
    end

    def create
        @car = Car.create(params.require(:car).permit(:name, 
                                                      category: @car_category.name,
                                                      daily_rate: @car_category.daily_rate,
                                                      car_insurance: @car_category.daily_rate, 
                                                      third_party_insurance: @car_category.third_party_insurance))
        redirect_to @car
    end

    #private
    #def params_car
    #    params.require(:car).permit(:name)
    #end

end
class CarsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @cars = Car.all
        @car_models = CarModel.all
        @subsidiaries = Subsidiary.all 
    end

    def show
        @car = Car.find(params[:id])
    end


    def new
        @car = Car.new
        @car_models = CarModel.all
        @subsidiaries = Subsidiary.all 
    end

    def create
        @car = Car.new(params.require(:car).permit(:name, :car_model_id, :subsidiary_id, :licence_plate, :color, 
                                                    :mileage ))
        if @car.save
            flash[:notice] = 'Modelo registrado com sucesso'
            redirect_to @car
        else
            @car_models = CarModel.all
            @subsidiaries = Subsidiary.all 

            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :new  
        end
    end

    def edit
        @car = Car.find(params[:id])
        @car_models = CarModel.all
        @subsidiaries = Subsidiary.all 
    end

    def update
        @car = Car.find(params[:id])

        if @car.update(params.require(:car).permit(:name, :car_model_id, :subsidiary_id, :licence_plate, :color, 
                                                    :mileage ))
            flash[:alert] = 'Modelo atualizado com sucesso!'
            redirect_to @car
        else
            @car_models = CarModel.all
            @subsidiaries = Subsidiary.all
            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :edit
        end
    end

    def destroy
        @car = Car.find(params[:id])
        @car.destroy
        redirect_to cars_path
    end

end
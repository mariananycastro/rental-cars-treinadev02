class CarModelsController < ApplicationController

    def index  
        @car_models = CarModel.all
    end


    def new
        @car_model = CarModel.new
        @manufacturers = Manufacturer.all
        @car_categories = CarCategory.all
    end

    def create
        @car_model = CarModel.new(params.require(:car_model).permit(:name, :year, :motorization, :fuel_type,
                                                                    :category_id, :manufacturer_id))
        if @car_model.save
            flash[:notice] = 'Modelo registrado com sucesso'
            redirect_to @car_model
        else
            @manufacturers = Manufacturer.all
            @car_categories = CarCategory.all
            # como eu rendirizar a pagina ela nao vai carregar as variaveis novamente
            # não coloco em cima p que ele só pegar todos os manufacturer e carCategory qdo der erro, 
            # senao toda vez q der submit ele vai carregar todos mesmo se não der erro.
            
            flash.now[:alert] = 'Erro'
            render :new        
        end
    end

    def show
        @car_model = CarModel.find(param[:id])
    end

    def edit
    end

end

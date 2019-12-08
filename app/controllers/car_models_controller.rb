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
                                                                    :car_category_id, :manufacturer_id))
        if @car_model.save
            flash[:notice] = 'Modelo registrado com sucesso'
            redirect_to @car_model
        else
            @manufacturers = Manufacturer.all
            @car_categories = CarCategory.all
            # como eu rendirizar a pagina ela nao vai carregar as variaveis novamente
            # não coloco em cima p que ele só pegar todos os manufacturer e carCategory qdo der erro, 
            # senao toda vez q der submit ele vai carregar todos mesmo se não der erro.
            
            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :new        
        end
    end

    def show
        @car_model = CarModel.find(params[:id])
    end

    def edit
        @car_model = CarModel.find(params[:id])
        @manufacturers = Manufacturer.all
        @car_categories = CarCategory.all
    end

    def update
        @car_model = CarModel.find(params[:id])
        
        if @car_model.update(params.require(:car_model).permit(:name, :year, :motorization, :fuel_type,
                                            :car_category_id, :manufacturer_id))
            flash[:alert] = 'Modelo atualizado com sucesso!'
            redirect_to @car_model
        else
            @manufacturers = Manufacturer.all
            @car_categories = CarCategory.all
            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :edit
        end
    end

end

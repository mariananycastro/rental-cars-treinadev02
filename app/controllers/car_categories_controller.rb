class CarCategoriesController < ApplicationController

    def index
        @car_categories = CarCategory.all
    end

    def show
        @car_category = CarCategory.find(params[:id])
    end

    def new
        @car_category = CarCategory.new()
    end

    def create
        @car_category = CarCategory.new(params_car_category)
        if @car_category.save
            flash[:alert] = 'Categoria Cadastrada com sucesso!'
            redirect_to @car_category
        else 
            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :new    
        end                                                                       
    end

    def edit
        @car_category = CarCategory.find(params[:id])
    end

    def update
        @car_category = CarCategory.find(params[:id])
        if @car_category.update(params_car_category)
            flash[:alert] = 'Categoria atualizada com sucesso!'
            redirect_to @car_category
        else 
            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :edit
        end

    end

    private

    def params_car_category
        params.require(:car_category).permit(:name, :daily_rate, :car_insurance,:third_party_insurance)
    end

end

class SubsidiariesController < ApplicationController
    def index
        @subsidiaries = Subsidiary.all
    end

    def show
        @subsidiary = Subsidiary.find(params[:id])
    end

    def new
        @subsidiary = Subsidiary.new()
    end

    def create
        @subsidiary = Subsidiary.new(params.require(:subsidiary).permit(:name, :cnpj, :address))
        if @subsidiary.save
            flash[:alert] = 'Filial cadastrada com sucesso!'
            redirect_to @subsidiary
        else 
            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :new
        end
    end

    def edit
        @subsidiary = Subsidiary.find(params[:id])
    end

    def update
        @subsidiary = Subsidiary.find(params[:id])

        if @subsidiary.update(params.require(:subsidiary).permit(:name, :cnpj, :address))
            flash[:alert] = 'Filial atualizado com sucesso!'
            redirect_to @subsidiary
        else
            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :edit
        end
    end

    def destroy
        @subsidiary = Subsidiary.find(params[:id])
        @subsidiary.destroy
        redirect_to subsidiaries_path
    end

end

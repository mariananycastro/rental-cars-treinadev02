class ManufacturersController < ApplicationController       

    def index
        @manufacturers = Manufacturer.all
    end

    def show
        @manufacturer = Manufacturer.find(params[:id])
        
    end

    def new
        @manufacturer = Manufacturer.new()
    end

    def create
        #byebug
        #name = params[:manufacturer][:name], mas deixa aberto p colocar outras coisas, 
        #não limita o que tem que preencher
        #require - chave manufactorer, e dentro dele vou permitir só o nome 
        
        @manufacturer = Manufacturer.create(params.require(:manufacturer).permit(:name))
        redirect_to @manufacturer
        
        # posso colocar http.....

        #render :new (simbolo) ou 'new' ou passar todo o caminho da view /home#index

    end
end


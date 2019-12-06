class ManufacturersController < ApplicationController
    before_action :authenticate_user!
    #before-action -- rails, authenticate_model -- devise  
    #before_actio :function, only: [:show :edit] 

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
        
        @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
      
        #params.permit(:name) p segunda opcao de formulario, pq ele nao manda um hash dentro de um hash
        #ele soh manda dentro de um hash

        if @manufacturer.save
            flash[:alert] = 'Fabricante cadastrado com sucesso!'
            redirect_to @manufacturer
        # posso colocar http.....
        # redirect chama uma action
        #render :new (simbolo) ou 'new' ou passar todo o caminho da view /home#index

        else 
            flash.now[:alert] = 'Você deve corrigir todos os erros para prosseguir'
            render :new
        #nao usei nenhuma action, so estou na view new, eu continuo no create
        #texto padrao, vai sempre aparecer se der algum erro, para aparecer mensagem especifica colocar na view 
        #ou model
        end
        
    end

    def edit
        @manufacturer = Manufacturer.find(params[:id])
    end

    def update
        @manufacturer = Manufacturer.find(params[:id])
        #byebug
        #no terminal dar um - params
        if @manufacturer.update(params.require(:manufacturer).permit(:name))
            flash[:alert] = 'Fabricante atualizado com sucesso!'
        #ou flash[:alert], ou qualquer outra palavra, mas com os dois modelos padroes
        # eu consigo chamar em outra lugar com :alert ou :notice
        # ele vale sempre para o proximo request, se quiser que seja no mesmo request trocar por
        # flash.now[:alert], por ex com render
            redirect_to @manufacturer
        else
            flash.now[:alert] = 'Você deve corrigir todos os erros para prossegui'
             render :edit

        end
    end
end


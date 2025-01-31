class ManufacturersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
    before_action :set_manufacturer, only: [:show, :edit, :update]
 
    #ou.. unless currente_user.admin
            # flash[:alert] = 'vc nao tem autorizacao'
            # redirect_to rooth_path
        #end

    #before-action -- rails, authenticate_model -- devise  
    #before_action :function, only: [:show :edit] 

    def index
        @manufacturers = Manufacturer.all
    end

    def show
        set_manufacturer
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
            redirect_to @manufacturer, notice: 'Fabricante cadastrado com sucesso!' 
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
        set_manufacturer
    end

    def update
        set_manufacturer
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

    def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @car_models = CarModel.where(manufacturer_id: @manufacturer.id)
    @car_models.each do |car_model|
        car_model.destroy
    end
    @manufacturer.destroy
    redirect_to manufacturers_path
    end

    private

    def set_manufacturer
        @manufacturer = Manufacturer.find(params[:id])
    end

    def authorize_admin
        redirect_to root_path, notice:'voce não tem autorizacao' unless current_user.admin?
    end
end


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
        @subsidiary = Subsidiary.create(params.require(:subsidiary).permit(:name, :cnpj, :address))
        redirect_to @subsidiary
    end

end

class SubsidiariesController < ApplicationController
    def index
        @subsidiaries = Subsidiary.all
    end

    def show
        #byebug
        @subsidiary = Subsidiary.find(params[:id])
    end
end

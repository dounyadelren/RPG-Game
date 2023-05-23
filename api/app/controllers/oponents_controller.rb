class OponentsController < ApplicationController
    def index
        @oponents = Oponent.all
        render json: @oponents
    end

    def show 
        @oponent = Oponent.find(params[:id])
        render json: @oponent
    end

    def create
        @oponent = Oponent.create(
            name: params[:name],
            level: params[:level],
            PV: params[:PV],
            STR: params[:STR],
            helmet: params[:helmet],
            weapon: params[:weapon],
            shield: params[:shield],
        )
        if @oponent.save
            render json: @oponent
        else
            render json: @oponent.errors
        end
    end

    def destroy
        @oponent = Oponent.find(params[:id])
        @oponent.destroy
        render json: @oponent, status: :ok
    end
end
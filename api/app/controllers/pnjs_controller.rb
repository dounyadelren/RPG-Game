class PnjsController < ApplicationController
    def index
        @pnjs = Pnj.all
        render json: @pnjs
    end

    def show
        @pnj = Pnj.find(params[:id])
        render json: @pnj
    end

    def create
        @pnj = Pnj.create(
            name: params[:name],
        )
        if @pnj.save
            render json: @pnj
        else
            render json: @pnj.errors
        end
    end

    def destroy
        @pnj = Pnj.find(params[:id])
        @pnj.destroy
        render json: @pnj, status: :ok
    end
end

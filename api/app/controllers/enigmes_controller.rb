class EnigmesController < ApplicationController
    def index
        @enigmes = Enigme.all
        render json: @enigmes
    end

    def show
        @enigme = Enigme.find(params[:id])
        render json: @enigme
    end

    def create
        @enigme = Enigme.create(
            question: params[:question],
            first_answer: params[:first_answer],
            second_answer: params[:second_answer],
            third_answer: params[:third_answer],
            fourth_answer: params[:fourth_answer],
            correct_answer: params[:correct_answer]
        )
        if @enigme.save
            render json: @enigme
        else
            render json: @enigme.errors
        end
    end

    def destroy
        @enigme = Enigme.find(params[:id])
        @enigme.destroy
        render json: @enigme, status: :ok
    end
end
class QuestsController < ApplicationController
    def index
        @quests = Quest.all
        render json: @quests
    end

    def createQuest
        @quest = Quest.create(
            level: params[:level],
            XP: params[:XP],
            gold: params[:gold],
            title: params[:title],
            objective: params[:objective],
            pnj: params[:pnj],
            enigme: params[:enigme],
            oponent: params[:oponent],
            rewardId: params[:rewardId]
        )
        if @quest.save
            render json: @quest
        else
            render json: @quest.errors
        end
    end

    def destroy
        @quest = Quest.find(params[:id])
        @quest.destroy
        render json: @quest, status: :ok
    end

    def update
        @quest = Quest.find(params[:id])
        @quest.update(
            level: params[:level],
            XP: params[:XP],
            gold: params[:gold],
            title: params[:title],
            objective: params[:objective],
            pnj: params[:pnj],
            enigme: params[:enigme],
            oponent: params[:oponent],
            rewardId: params[:rewardId]
        )
        render json: @quest
    end

    def show
        @quest = Quest.find(params[:id])
        render json: @quest
    end
end

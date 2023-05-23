class CharactersController < ApplicationController
    def index
        @characters = Character.all
        render json: @characters
    end

    def create
        @character = Character.create(
            name: params[:name],
            player: params[:player],
            imageId: params[:imageId]
        )
        @inventory = Inventory.create(
            items: []
        )
        @character.update(
            inventory: @inventory.id
        )
        if @character.save
            render json: @character, status: :created
        else
            render json: { errors: @character.errors.full_messages }, status: :bad_request
        end
    end

    def charactersPlayer
        @characters = Character.where(player: params[:id])
        render json: @characters
    end

    def chooseCharater
        @character = Character.find(params[:id])
        render json: @character
    end

    def updatePVStats
        @character = Character.find(params[:id])
        if @character.pointsStats > 0
            @character.update(
                pointsStats: @character.pointsStats - 1
            )
            @character.update(
                PV: @character.PV + 1
            )
            render json: @character
        else 
            render json: { errors: "Not enough points" }, status: :bad_request
        end
    end

    def updateSTRStats
        @character = Character.find(params[:id])
        if @character.pointsStats > 0
            @character.update(
                pointsStats: @character.pointsStats - 1
            )
            @character.update(
                STR: @character.STR + 1
            )
            render json: @character
        else 
            render json: { errors: "Not enough points" }, status: :bad_request
        end
    end

    def updateXPStats
        @character = Character.find(params[:id])
        @character.update(
            xp: @character.xp + params[:xp]
        )
        render json: @character
    end

    def destroy
        @character = Character.find(params[:id])
        @character.destroy
        render json: @character, status: :not_found
    end

    def acceptQuest
        @character = Character.find(params[:id])
        @character.update(
            quests: @character.quests.push(params[:quest])
        )
        @quest = Quest.find(params[:quest])
        render json: @quest
    end

    def getInventory
        @character = Character.find(params[:id])
        @inventory = Inventory.find(@character.inventory)
        render json: @inventory
    end

    def updateCharacterAfterWin
        @character = Character.find(params[:idChar])
        @quest = Quest.find(params[:idQuest])
        @character.update(
            questsDone: @character.questsDone.push(params[@quest])
        )
        render json: @character
    end
end

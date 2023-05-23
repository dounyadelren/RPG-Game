class InventoriesController < ApplicationController
    def index
        @inventories = Inventory.all
        render json: @inventories
    end

    def addItem
        @character = Character.find(params[:id])
        @inventory = Inventory.find(@character.inventory)
        @inventory.update(
            items: @inventory.items.push(params[:item])
        )
        @inventory.update(
            nbItems: @inventory.items.length
        )
        render json: @inventory
    end

    def deleteItem
        @character = Character.find(params[:id])
        @inventory = Inventory.find(@character.inventory)
        for value in @inventory.items
            if value == params[:item]
                @inventory.items.delete(value)
            end
        end
        @inventory.update(
            nbItems: @inventory.items.length
        )
        @inventory.save
        render json: @inventory
    end

    def addGold 
        @character = Character.find(params[:id])
        @inventory = Inventory.find(@character.inventory)
        @inventory.update(
            gold: @inventory.gold + params[:gold]
        )
        render json: @inventory
    end
end

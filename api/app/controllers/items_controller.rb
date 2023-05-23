class ItemsController < ApplicationController
    def index
        @items = Item.all
        render json: @items
    end

    def show
        @items = Item.find(params[:id])
        render json: @items
    end

    def createItem
        @item = Item.create(
            name: params[:name],
            description: params[:description],
            price: params[:price],
            level: params[:level],
            typeOfEquipment: params[:typeOfEquipment]
        )
        if @item.save
            render json: @item, status: :created
          else
            render json: { errors: @item.errors.full_messages }, status: :bad_request
        end
    end

    def buyItem
        @character = Character.find(params[:id])
        @inventory = Inventory.find(@character.inventory)
        @item = Item.find(params[:item])
        if @inventory.gold >= @item.price
            @inventory.update(
                gold: @inventory.gold - @item.price
            )
            @inventory.update(
                items: @inventory.items.push(params[:item])
            )
            @inventory.update(
                nbItems: @inventory.items.length
            )
            render json: @inventory
        else
            render json: { errors: "Not enough gold" }, status: :bad_request
        end
    end

    def sellItem
        @character = Character.find(params[:id])
        @inventory = Inventory.find(@character.inventory)
        @item = Item.find(params[:item])
        @inventory.update(
            gold: @inventory.gold + @item.price
        )
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

    def destroyItem
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


    def getHelmet
        @items = Item.where(typeOfEquipment: 'helmet')
        if @items.length == 0
            render json: { errors: "No helmets" }, status: :bad_request
        else
            render json: @items
        end
    end

    def getWeapon
        @items = Item.where(typeOfEquipment: 'weapon')
        if @items.length == 0
            render json: { errors: "No weapons" }, status: :bad_request
        else
            render json: @items
        end
    end

    def getShield
        @items = Item.where(typeOfEquipment: 'shield')
        if @items.length == 0
            render json: { errors: "No shields" }, status: :bad_request
        else
            render json: @items
        end
    end
end

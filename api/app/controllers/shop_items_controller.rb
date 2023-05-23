class ShopItemsController < ApplicationController
    def index
        @shop_items = ShopItem.all
        render json: @shop_items
    end

    def show
        @shop_item = ShopItem.find(params[:id])
        render json: @shop_item
    end

    def create
        @shop_item = ShopItem.create(
            idItem: params[:idItem],
            name: params[:name],
            level: params[:level],
            price: params[:price],
            typeOfEquipment: params[:typeOfEquipment],
            sellerId: params[:sellerId]
        )
        @inventory = Inventory.where(id: @shop_item.sellerId)
        puts ['---------',@inventory]
        @inventory.update(
            items: @inventory.items.where(id: @shop_item.idItem).delete
        )
        @inventory.update(
            nbItems: @inventory.nbItems - 1
        )
        @inventory.save
        if @shop_item.save
            render json: @shop_item
        else
            render json: @shop_item.errors
        end
    end

    def buyItem
        @shop_item = ShopItem.find(params[:id])
        @character = Character.find(params[:characterId])
        @inventory = Inventory.find(@character.inventory)
        @inventory.update(
            gold: @inventory.gold - @shop_item.price
        )
        @inventory.update(
            items: @inventory.items.push(@shop_item.idItem)
        )
        @inventory.update(
            nbItems: @inventory.nbItems + 1
        )
        @seller = Character.find(@shop_item.sellerId)
        @sellerInventory = Inventory.find(@seller.inventory)
        @sellerInventory.update(
            gold: @sellerInventory.gold + @shop_item.price
        )
        @sellerInventory.save
        @inventory.save
        @shop_item.destroy
        render json: @shop_item, status: :ok
    end
end

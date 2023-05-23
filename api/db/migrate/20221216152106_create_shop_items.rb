class CreateShopItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_items do |t|
      t.integer :idItem
      t.string :name
      t.integer :level
      t.integer :price
      t.integer :typeOfEquipment
      t.integer :sellerId
      t.timestamps
    end
  end
end

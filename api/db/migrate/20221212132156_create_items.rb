class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string "name"
      t.string "description"
      t.integer "price"
      t.integer "level"
      t.string "typeOfEquipment"
      t.timestamps
    end
  end
end

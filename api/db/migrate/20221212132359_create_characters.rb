class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string "name"
      t.integer "level", default: 1
      t.integer "xp", default: 0
      t.integer "PV", default: 10
      t.integer "STR", default: 10
      t.integer "helmet"
      t.integer "weapon"
      t.integer "shield"
      t.integer "inventory"
      t.integer "pointsStats", default: 10
      t.text :quests, array: true
      t.text :questsDone, array: true
      t.text :fights, array: true
      t.integer "player"
      t.integer "imageId"
      t.timestamps
    end
  end
end

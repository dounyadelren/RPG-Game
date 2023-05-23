class CreateQuests < ActiveRecord::Migration[7.0]
  def change
    create_table :quests do |t|
      t.integer "level"
      t.integer "XP"
      t.integer "gold"
      t.string "title"
      t.string "objective"
      t.integer "pnj"
      t.integer "enigme"
      t.integer "oponent"
      t.integer "imageId"
      t.integer "rewardId"
      t.timestamps
    end
  end
end

class CreateOponents < ActiveRecord::Migration[7.0]
  def change
    create_table :oponents do |t|
      t.string "name"
      t.integer "level"
      t.integer "PV"
      t.integer "STR"
      t.integer "helmet"
      t.integer "weapon"
      t.integer "shield"
      t.timestamps
    end
  end
end

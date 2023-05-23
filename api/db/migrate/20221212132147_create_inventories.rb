class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer "nbItems"
      t.integer "gold", default: 500
      t.text :items, array: true
      t.timestamps
    end
  end
end

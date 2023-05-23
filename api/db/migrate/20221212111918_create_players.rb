class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string "username", unique: true
      t.string "email"
      t.string "password_digest", null: false, length: { minimum: 6 }
      t.integer "friends", array: true
      t.integer "friendsBan", array: true
      t.integer "friendsRequests", array: true
      t.integer "conversations", array: true
      t.integer "roles"
      t.timestamps
    end
  end
end

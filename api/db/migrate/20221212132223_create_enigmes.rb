class CreateEnigmes < ActiveRecord::Migration[7.0]
  def change
    create_table :enigmes do |t|
      t.string "question"
      t.string "first_answer"
      t.string "second_answer"
      t.string "third_answer"
      t.string "fourth_answer"
      t.string "correct_answer"
      t.timestamps
    end
  end
end

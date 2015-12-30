class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :name
      t.integer :word_id
      t.string :correct_answer

      t.timestamps null: false
    end
  end
end

class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :category_id
      t.string :word
      t.string :answer

      t.timestamps null: false
    end
  end
end

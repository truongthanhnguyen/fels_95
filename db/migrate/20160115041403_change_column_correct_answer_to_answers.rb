class ChangeColumnCorrectAnswerToAnswers < ActiveRecord::Migration
  def change
    change_column :answers, :correct_answer, :boolean
  end
end

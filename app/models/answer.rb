class Answer < ActiveRecord::Base
  belongs_to :word
  belongs_to :result
  scope :number_correct_answer, ->(){where(correct_answer: true).count}
end

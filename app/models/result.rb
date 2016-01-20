class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer
  scope :results_by_lesson, ->(lesson_id){where lesson_id: lesson_id}
end

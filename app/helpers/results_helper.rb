module ResultsHelper

  def get_icon answer
    answer.correct_answer? ? "ok" : "remove"
  end

  def infor_lesson lesson
    "#{lesson.numbers_correct_answer}/#{lesson.results.count}"
  end
end

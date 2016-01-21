class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :words, through: :results, source: "word"
  has_many :answers, through: :results
  has_many :results, dependent: :destroy
  validate :check_number_words_category
  accepts_nested_attributes_for :results
  after_create :add_lesson_activity

  def numbers_correct_answer
    answers.number_correct_answer
  end

  private
  def check_number_words_category
    words_of_category = category.words.nil? ? 0 : category.words.count
    if words_of_category < Settings.lesson.lessonsize
      flash[:danger] = t "word.not_enough"
    end
  end

  def add_lesson_activity
    Activity.create user_id: user.id, user_name: user.name,
      content: category.name, type_content: Settings.activity.LESSON_TYPE
  end
end

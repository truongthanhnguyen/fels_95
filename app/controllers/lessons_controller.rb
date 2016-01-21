class LessonsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :update]
  before_action :create_lesson, only: [:index]
  before_action :load_lesson

  def index
  end

  def show
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = t "lesson.submit_success"
      redirect_to lesson_results_path @lesson
    else
      flash[:danger] = t "lesson.update_failed"
      redirect_to root_url
    end
  end

  private
  def create_lesson
    @category = Category.find params[:category_id]
    lesson = Lesson.new category_id: @category.id, user_id: current_user.id
    @transaction_success = true
    Lesson.transaction do
      begin
        lesson.save!
        words = Word.generate_words_in_lessons @category.id
        Result.transaction(requires_new: true) do
          Word.save_words_to_results lesson.id, words
        end
      rescue
        @transaction_success = false
        raise ActiveRecord::Rollback
      end
      if @transaction_success
        flash[:success] = t "lesson.create_lesson_success"
        redirect_to lesson
      else
        redirect_to root_url
      end
    end
  end

  def lesson_params
    params.required(:lesson).permit results_attributes: [:id, :word_id, :answer_id]
  end

  def load_lesson
    @lesson = Lesson.find params[:id]
  end
end

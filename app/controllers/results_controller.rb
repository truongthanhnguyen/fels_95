class ResultsController < ApplicationController
  before_action :logged_in_user
  before_action :load_lesson

  def index
    @results = Result.results_by_lesson @lesson.id
  end

  def show
  end

  private
  def load_lesson
    @lesson = Lesson.find params[:lesson_id]
  end
end

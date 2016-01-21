class Admin::WordsController < ApplicationController
  before_action :authenticate_admin
  before_action :load_category
  before_action :load_word, only: [:edit, :update, :destroy]

  def index
    @answers_number = Settings.answers_number
    @words = @category.words.paginate page: params[:page], per_page: Settings.perpage
  end

  def new
    @word = Word.new
    Settings.answers_number_size.times {@word.answers.build}
  end

  def edit
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = t "admin.word.update_success"
      redirect_to [:admin, :category, :words]
    else
      flash[:danger] = t "admin.word.update_failed"
      render :edit
    end
  end

  def destroy
    @word.destroy
    flash[:success] = t "admin.word.deleted_word"
    redirect_to [:admin, :category, :words]
  end

  def create
    @word = @category.words.build word_params
    if @word.save
      flash[:success] = t "admin.word.create_word_success"
      redirect_to [:admin, :category, :words]
    else
      render :new
    end
  end

  private
  def word_params
    params.require(:word).permit :name, answers_attributes: [:id, :name, :correct_answer, :_destroy]
  end

  def load_category
    @category = Category.find params[:category_id]
  end

  def load_word
    @word = Word.find params[:id]
  end
end

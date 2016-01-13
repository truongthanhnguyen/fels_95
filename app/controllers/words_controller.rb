class WordsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :load_word

  def index
    @word_filter = params[:button].nil? ? Word.all : Word.word_by_filter.(@current_user.id, @category, @status)
    @words = @word_filter.paginate page: params[:page], per_page: Settings.perpage
  end

  private
  def load_word
    @categories = Category.all
    @category = params[:category].to_i
    @word_statuses = Word.all_status
    @status = params[:status].nil? ? @word_statuses[0] : params[:status].to_i
  end
end

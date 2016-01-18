class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @categories = Category.paginate page: params[:page]
  end
end

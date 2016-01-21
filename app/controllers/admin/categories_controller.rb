class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.paginate page: params[:page]
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "admin.category.update_success"
      redirect_to admin_root_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = t "admin.category.destroy_success"
    redirect_to admin_root_url
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "admin.category.created_category"
      redirect_to admin_root_url
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find params[:id]
  end
end

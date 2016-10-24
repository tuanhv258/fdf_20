class CategoriesController < ApplicationController
  load_and_authorize_resource
  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      redirect_to categories_path
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  def index
    @categories = Category
      .select(:id, :category_name, :description)
      .includes(:products).page(params[:page])
      .per Settings.categories_per_page
    @category = Category.new

  end

  def update

  end

  private
  def category_params
    params.require(:category).permit :category_name, :description
  end
end

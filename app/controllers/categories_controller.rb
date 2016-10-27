class CategoriesController < ApplicationController
  load_and_authorize_resource
  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      success = t ".success"
    else
      failed = "fail"
    end
    render json: {
      success: success, fail: failed
    }
  end

  def index
    @q = Category.ransack params[:q]
    @categories = @q.result.includes(:products).page(params[:page])
      .per Settings.categories_per_page
    @category = Category.new
  end

  def update
    @category.update_attributes category_params
    if @category.save
      flash[:success] = t ".updatesuccess"
      redirect_to :back
    else
      flash[:danger] = t ".updatefail"
      redirect_to :back
    end
  end

  private
  def category_params
    params.require(:category).permit :category_name, :description
  end
end

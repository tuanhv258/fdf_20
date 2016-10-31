class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: :index

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
    respond_to do |format|
      format.html
      format.xls { send_data(@categories.to_xls) }
      format.xls {
        filename = "Category-" + I18n.l(Time.now) + ".xls"
        send_data(@categories.to_xls(only: [:category_name, :description]),
        type: "text/xls; charset=utf-8; header=present", filename: filename)
       }
    end
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

  def load_categories
    @categories = Category.all
  end
end

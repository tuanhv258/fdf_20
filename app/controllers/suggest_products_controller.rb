class SuggestProductsController < ApplicationController
  before_action :load_categories, only: :index

  def new
    @suggest = SuggestProduct.new
  end

  def create
    @suggest = SuggestProduct.new suggest_params
    if @suggest.save
      flash[:success] = t ".success"
      redirect_to root_path
    else
      flash[:danger] = t ".fail"
      render :new
    end
  end

  def index
    @q = SuggestProduct.ransack params[:q]
    @suggests = @q.result.page(params[:page]).per Settings.categories_per_page
  end

  private

  def suggest_params
    params.require(:suggest_product).permit :product_name, :product_des,
      :product_price, :category_id, :user_id
  end

  def load_categories
    @categories = Category.all
  end
end

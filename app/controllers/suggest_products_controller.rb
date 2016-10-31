class SuggestProductsController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: [:new, :index, :update]
  before_action :load_suggests, only: :index

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
    respond_to do |format|
      format.html
      format.xls {send_data(@suggests.to_xls)}
      format.xls {
        filename = "Suggests-" + I18n.l(Time.now) + ".xls"
          send_data(@suggests.to_xls(only: [:product_name, :product_des,
          :price, :status]), type: "text/xls; charset=utf-8; header=present",
          filename: filename)
      }
    end
  end

  def update
    @suggest_product.update_attributes suggest_params
    flash[:success] = t ".updatesuccess"
    redirect_to :back
  end

  def destroy
    @suggest = SuggestProduct.find_by id: params[:suggest_id]
    if @suggest.present?
      if @suggest.destroy
        flash[:success] = t ".success"
        success = t ".success"
      else
        flash[:danger] = t ".danger"
        fails = t ".danger"
      end
    else
      flash[:danger] = t ".danger"
      fails = t ".danger"
    end
    render json: {
      fails: fails, success: success
    }
  end

  private

  def suggest_params
    params.require(:suggest_product).permit :product_name, :product_des,
      :product_price, :category_id, :user_id, :status
  end

  def load_categories
    @categories = Category.all
  end

  def load_suggests
    @suggests = SuggestProduct.all
  end
end

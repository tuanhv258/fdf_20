class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: :index

  def index
    @product = Product.new
    @products = Product.select(:image, :product_name, :price,
      :description, :quantity,
      :category_id).page(params[:page]).per Settings.product_per_page
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".addproductsuccess"
      redirect_to products_path @product
    else
      flash[:danger] = t ".addproductnotsuccess"
      redirect_to products_path
    end
  end

  private
  def load_categories
    @categories = Category.select :id, :category_name
  end

  def product_params
    params.require(:product).permit :image, :product_name,
      :price, :description, :quantity, :category_id
  end
end

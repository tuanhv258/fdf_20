class DeleteCategoriesController < ActionController::Base
  def destroy
    @categories = Category.search_category params[:ids]
    success = Array.new
    fails = Array.new
    success_id = Array.new
    @categories.each do |category|
      if category.products.any?
        fails.push(category.category_name)
      else
        success.push(category.category_name)
        success_id.push(category.id)
        category.destroy
      end
    end
    render json: {
      fails: fails, success: success, success_id_delete: success_id
    }
  end
end


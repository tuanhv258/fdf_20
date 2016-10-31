class SuggestProduct < ActiveRecord::Base
  after_update :add_to_product
  before_destroy :remove_to_product
  belongs_to :user
  belongs_to :category

  scope :are_rejected, ->{where status: false}

  private

  def add_to_product
    suggest_product = Product.new
    suggest_product.product_name = self.product_name
    suggest_product.category_id = self.category_id
    suggest_product.price = self.product_price
    suggest_product.description = self.product_des
    suggest_product.save
  end


  def remove_to_product
    suggest_product = Product.find_by product_name: self.product_name,
      description: self.product_des
    suggest_product.destroy
  end


end

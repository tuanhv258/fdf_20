class Category < ActiveRecord::Base
  include Sort

  has_many :products
  has_many :suggest_products

end

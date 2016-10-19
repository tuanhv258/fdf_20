class User < ActiveRecord::Base
  has_many :orders
  has_many :comments
  has_many :suggest_products
end

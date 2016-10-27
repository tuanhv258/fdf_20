class Category < ActiveRecord::Base
  include Sort

  has_many :products
  has_many :suggest_products

  validates :category_name, presence: true,
    length: {maximum: 255}
  validates :description, presence: true, length: {maximum: 255}

  scope :search_category, ->ids{where id: ids}

end

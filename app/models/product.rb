class Product < ActiveRecord::Base
  has_many :comments
  has_many :order_details
  belongs_to :category

  mount_uploader :image, ImageUploader
end

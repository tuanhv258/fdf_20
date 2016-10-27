class Product < ActiveRecord::Base
  has_many :comments
  has_many :order_details
  belongs_to :category
  ratyrate_rateable "quality", "price", "service"
  mount_uploader :image, ImageUploader
end

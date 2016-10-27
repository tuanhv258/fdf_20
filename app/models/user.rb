class User < ActiveRecord::Base
  ratyrate_rater

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :comments
  has_many :suggest_products

  enum role: [:admin, :member, :guest]
end

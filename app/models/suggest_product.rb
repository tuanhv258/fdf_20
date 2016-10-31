class SuggestProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  scope :are_rejected, ->{where status: false}
end

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author
  has_many :likes, dependent: :destroy
  
  has_ancestry
end

class Post < ApplicationRecord
  belongs_to :author
  has_one_attached :image
  has_many :comments, dependent: :destroy
  validates :title, :content, presence: true, length: { minimum: 3 }
  validates :image, presence: true
  is_impressionable counter_cache: true

  def self.search(search)
    where("title LIKE ? OR content LIKE ?", "%#{search}%","%#{search}%")
  end
end

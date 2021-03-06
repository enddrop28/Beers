class Post < ApplicationRecord
  
  attachment :post_image
  belongs_to :user
  belongs_to :category
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 200}
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end
end

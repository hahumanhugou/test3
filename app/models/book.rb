class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 }

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

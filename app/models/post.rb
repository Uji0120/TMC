class Post < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :like, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  
  has_many :comment, dependent: :destroy
  belongs_to :user
  belongs_to :genre

  
  def bookmarked_by?(user)
    bookmark.exists?(user_id: user.id)
  end
  
  
end

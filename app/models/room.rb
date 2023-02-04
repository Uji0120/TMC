class Room < ApplicationRecord
  
  # has_many :user_rooms
  # has_many :chats
  
  # belongs_to :user
  # belongs_to :room
  
  has_many :users, through: :user_rooms
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  
end

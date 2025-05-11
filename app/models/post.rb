class Post < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: 200 }, presence: true
  # お気に入り機能の関連付け
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
end

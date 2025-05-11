class Post < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: 200 }, presence: true
  # お気に入り機能の関連付け
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  # リプライ機能の関連付け
  belongs_to :parent, class_name: "Post", optional: true
  has_many :replies, class_name: "Post", foreign_key: "parent_id", dependent: :destroy
  # 画像アップロード機能の関連付け
  has_one_attached :image
end

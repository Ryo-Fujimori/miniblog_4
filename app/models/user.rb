class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # postの関連付け
  has_many :posts, dependent: :destroy
  # フォロー機能の関連付け
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  # プロフィールのバリデーション
  validates :profile, length: { maximum: 200 }
  # いいね機能の関連付け
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  def follow(followed_id)
    active_relationships.create(followed_id: followed_id)
  end

  # ユーザーが他のユーザーのフォローを解除するメソッド
  def unfollow!(followed_id)
    active_relationships.find_by(followed_id: followed_id).destroy!
  end

  # フォローしているかどうかを確認するメソッド
  def following?(followed_id)
    active_relationships.find_by(followed_id: followed_id).present?
  end

  # ポストをお気に入りするメソッド
  def favorite(post_id)
    favorites.create(post_id: post_id)
  end

  # ポストのお気に入りを解除するメソッド
  def unfavorite(post_id)
    Rails.logger.debug post_id
    favorites.find_by(post_id: post_id).destroy!
  end

  # お気に入りしているかどうかを確認するメソッド
  def favoriting?(post_id)
    favorites.find_by(post_id: post_id).present?
  end
end

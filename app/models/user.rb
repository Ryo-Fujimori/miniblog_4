class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy

  validates :profile, length: { maximum: 200 }

  # ユーザーが他のユーザーをフォローするメソッド
  def follow(followed_id)
    active_relationships.create(followed_id: followed_id)
  end
  # ユーザーが他のユーザーのフォローを解除するメソッド
  def unfollow(followed_id)
    active_relationships.find_by(followed_id: followed_id).destroy!
  end
  # フォローしているかどうかを確認するメソッド
  def following?(followed_id)
    active_relationships.find_by(followed_id: followed_id).present?
  end
end

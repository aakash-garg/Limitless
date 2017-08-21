class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments

  has_attached_file :image, styles: { medium: "300x300#", small: "100x100#", logo: "10x10#" }, :default_url => ActionController::Base.helpers.asset_path("user-profile.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  class UserRelations
    SELF = 1
    FOLLOWED = 2
    NOTFOLLOWED = 3
  end

  def follow_relation user_id
    return UserRelations::SELF if user_id == id
    if FollowMapping.where(:followee_id => user_id, :follower_id => id).length > 0
      return UserRelations::FOLLOWED
    else
      return UserRelations::NOTFOLLOWED
    end
  end

  def can_follow user_id
    return follow_relation(user_id) == UserRelations::NOTFOLLOWED
  end

  def can_unfollow user_id
    return follow_relation(user_id) == UserRelations::FOLLOWED
  end

  def followee_ids
    FollowMapping.where(:follower_id => id).pluck(:followee_id)
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments

  has_attached_file :image, styles: { medium: "300x300#", small: "100x100#", logo: "10x10#" }, :default_url => ActionController::Base.helpers.asset_path("user-profile.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

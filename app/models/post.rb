class Post < ActiveRecord::Base
  validates :title, presence: true, length: {within: 5..50}
  validates :body, presence: true, length: {within: 10..500}
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable

  has_attached_file :image, styles: { medium: "600x400#", thumb: "350x250#" }, :default_url => ActionController::Base.helpers.asset_path("placeholder-image.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

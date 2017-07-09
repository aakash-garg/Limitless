class Post < ActiveRecord::Base
  validates :title, presence: true, length: {within: 5..50}
  validates :body, presence: true, length: {within: 10..500}
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
end

class FollowMapping < ActiveRecord::Base
  validates_uniqueness_of :followee_id, scope: :follower_id

  after_create :send_follow_mail

  def send_follow_mail
    # FollowMailer.send_follow_mail(id).deliver_now
    Resque.enqueue(FollowMail, id)
  end
end

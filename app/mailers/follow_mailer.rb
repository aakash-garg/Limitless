class FollowMailer < ApplicationMailer

  def send_follow_mail id
    @followee_id = FollowMapping.find(id).followee_id
    @follower_id = FollowMapping.find(id).follower_id
    @followee = User.find(@followee_id)
    @follower = User.find(@follower_id)

    mail to: @followee.email, subject:"New Follower <LIMITLESS>"
  end
end

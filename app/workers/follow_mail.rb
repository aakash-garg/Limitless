class FollowMail

  @queue = :send_mail

  def self.perform id
    FollowMailer.send_follow_mail(id).deliver_now
  end
end
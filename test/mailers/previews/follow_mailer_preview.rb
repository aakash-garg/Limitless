# Preview all emails at http://localhost:3000/rails/mailers/follow_mailer
class FollowMailerPreview < ActionMailer::Preview
  def send_follow_mail_preview
    FollowMailer.send_follow_mail(FollowMapping.last.id)
  end
end

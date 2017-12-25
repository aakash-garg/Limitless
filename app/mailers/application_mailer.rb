class ApplicationMailer < ActionMailer::Base
  default from: "aakashgargdtu98@gmail.com"
  layout 'mailer'
  add_template_helper EmailHelper
  add_template_helper ApplicationHelper
end

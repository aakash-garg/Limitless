class ApplicationMailer < ActionMailer::Base
  default from: "be.limitless@gmail.com"
  layout 'mailer'
  add_template_helper EmailHelper
  add_template_helper ApplicationHelper
end

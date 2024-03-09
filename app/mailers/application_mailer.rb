class ApplicationMailer < ActionMailer::Base
  # Temp till actuall domain is found
  default from: 'noreply@greenhouse.io'
  layout 'mailer'
end

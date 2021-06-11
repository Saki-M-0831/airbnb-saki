# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => 'SG.WFBcWi90SMSR_NHp3UEX6Q.Lc-c7V0KcRfkW1wl7SEwrNRpNpEl_jwpeVHS183GXNA', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'http://localhost:3005"',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

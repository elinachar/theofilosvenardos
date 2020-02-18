# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

# Connect to SendGrid email provider
ActionMailer::Base.smtp_settings = {
  address: 'webmail.theofilosvenardos.com',
  port: '465',
  authentication: :plain,
  user_name: ENV['ROUNDCUBE_USERNAME'],
  password: ENV['ROUNDCUBE_PASSWORD'],
  domain: 'theofilosvenardos.com',
  enable_starttls_auto: true
}

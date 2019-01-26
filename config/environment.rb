# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

# Connect to SendGrid email provider
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  domain: 'heroku.com',
  enable_starttls_auto: true
}

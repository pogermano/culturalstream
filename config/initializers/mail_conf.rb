 ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
              :address              => "smtp.gmail.com",
              :port                 => 587,
              :domain               => 'culturalstream.com', # Domain for HELO.
              :user_name            => 'webmaster.embaixada',
              :password             => 'embaixada123456',
              :authentication       => 'plain',
              :enable_starttls_auto => true
      }

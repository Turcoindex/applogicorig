# frozen_string_literal: true

module Barong
  module Model
    class AccountUpdatedConsumer
      def call(event)
        token = event[:record][:confirmation_token]
        email = event[:record][:email]
        level = event[:record][:level]
        if level == 0
          AccountMailer.verification_email(email, token).deliver_now
        end
      end
  
      class << self
        def call(event)
          new.call(event)
        end
      end
    end
  end
end


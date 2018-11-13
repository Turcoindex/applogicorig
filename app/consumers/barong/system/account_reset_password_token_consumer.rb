# frozen_string_literal: true

module Barong
  module System
    class AccountResetPasswordTokenConsumer
      def call(event)
        token = event[:record][:token]
        email = event[:record][:email]
        BarongMailer.reset_password(email, token).deliver_now
      end
  
      class << self
        def call(event)
          new.call(event)
        end
      end
    end
  end
end
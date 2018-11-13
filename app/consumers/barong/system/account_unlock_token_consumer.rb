# frozen_string_literal: true

module Barong
  module System
    class AccountUnlockTokenConsumer
      def call(event)
        token = event[:record][:token]
        email = event[:record][:email]
        BarongMailer.unlock_account(email, token).deliver_now
      end
    
      class << self
        def call(event)
          new.call(event)
        end
      end
    end
  end
end
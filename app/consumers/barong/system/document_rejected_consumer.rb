# frozen_string_literal: true

module Barong
  module System
    class DocumentRejectedConsumer
      def call(event)
        email = event.fetch(:email)
        BarongMailer.document_rejected_email(email).deliver_now
      end
  
      class << self
        def call(event)
          new.call(event)
        end
      end
    end
  end
end
  
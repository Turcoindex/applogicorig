# frozen_string_literal: true

task event_api_listener: :environment do
  Rails.logger = ActiveSupport::Logger.new(STDOUT, level: :debug)
  EventAPIListener.call \
    ENV.fetch('EVENT_API_APPLICATION'),
    ENV.fetch('EVENT_API_EVENT_CATEGORY'),
    ENV.fetch('EVENT_API_EVENT_NAME')
end

task email_listeners: :environment do
  Rails.logger = ActiveSupport::Logger.new(STDOUT, level: :debug)

  Thread.report_on_exception = true
  Thread.abort_on_exception = true

  threads = []

  listeners_args = [
    %w[barong model account.created],
    %w[barong system document.verified],
    %w[barong system document.rejected],
    %w[barong system account.reset_password_token],
    %w[barong system account.unlock_token]
  ]

  listeners_args.each do |args|
    threads << Thread.new { EventAPIListener.call(*args) }
    sleep 1
  end
  threads.each(&:join)
end

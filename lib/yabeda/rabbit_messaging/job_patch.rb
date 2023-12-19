# frozen_string_literal: true

# Patch to get metrics from Rabbit::Receiving::Job
# https://github.com/umbrellio/rabbit_messaging/blob/master/lib/rabbit/receiving/job.rb
module Yabeda
  module RabbitMessaging
    module JobPatch
      def perform(message, arguments)
        duration = Benchmark.realtime { super(message, arguments) }
      ensure
        labels = arguments.slice(:exchange, :routing_key)

        if labels.present?
          labels[:success] = duration.present?

          Yabeda.rabbit_messages_total.increment(labels)
          Yabeda.rabbit_messages_duration.measure(labels, duration) if duration
        end
      end
    end
  end
end

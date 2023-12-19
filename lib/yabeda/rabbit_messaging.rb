# frozen_string_literal: true

require "active_support"
require "yabeda"
require "rabbit_messaging"

require "yabeda/rabbit_messaging/job_patch"
require "yabeda/rabbit_messaging/version"

if defined?(Yabeda)
  Yabeda.configure do
    counter :rabbit_messages_total do
      comment "A counter of the total number of messages by exchange."
      tags %i[exchange routing_key success]
    end

    histogram :rabbit_messages_duration do
      comment "A histogram of the messages latency."
      buckets [0.1, 0.25, 0.5, 1, 2.5, 5, 10, 30, 60]
      tags %i[exchange routing_key success]
      unit :seconds
    end
  end

  if defined?(Rabbit::Receiving::Job)
    Rabbit::Receiving::Job.prepend(Yabeda::RabbitMessaging::JobPatch)
  end
end

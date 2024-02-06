# frozen_string_literal: true

describe Yabeda::RabbitMessaging do
  describe "#prepend" do
    it "Rabbit::Receiving::Job ancestors" do
      expect(Rabbit::Receiving::Job.ancestors.first).to eq(described_class::JobPatch)
    end
  end

  describe "#configure" do
    it "configure metrics" do
      expect(Yabeda.metrics.keys).to include("rabbit_messages_total", "rabbit_messages_duration")
    end
  end
end

describe Yabeda::RabbitMessaging::JobPatch do
  describe "#perform" do
    before { allow(Yabeda.rabbit_messages_total).to receive(:increment).and_call_original }

    let(:arguments) do
      {
        app_id: "test_app_id",
        type: "test_type",
        exchange: "test_exchange",
        routing_key: "test_routing_key",
      }
    end

    it "send metrics to Yabeda" do
      Rabbit::Receiving::Job.perform_now("{}", arguments) rescue nil

      expect(Yabeda.rabbit_messages_total).to have_received(:increment) do |args|
        expect(args).to eq(
          exchange: "test_exchange",
          routing_key: "test_routing_key",
          success: false,
        )
      end
    end
  end
end

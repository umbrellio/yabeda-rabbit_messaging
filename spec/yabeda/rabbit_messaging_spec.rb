# frozen_string_literal: true

describe Yabeda::RabbitMessaging do
  describe "#prepend" do
    it "Rabbit::Receiving::Job ancestors" do
      expect(Rabbit::Receiving::Job.ancestors.first).to eq(described_class::JobPatch)
    end
  end
end

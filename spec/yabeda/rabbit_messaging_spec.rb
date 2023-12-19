# frozen_string_literal: true

describe Yabeda::RabbitMessaging do
  describe "#initialize" do
    it "prepend Rabbit::Receiving::Job" do
      expect(Rabbit::Receiving::Job.ancestors.first).to eq(described_class::JobPatch)
    end
  end
end

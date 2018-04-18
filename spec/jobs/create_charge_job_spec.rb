require "rails_helper"
require "stripe_mock"

RSpec.describe CreateChargeJob, :type => :job do
  describe "#perform_later" do
    let(:stripe_helper) { StripeMock.create_test_helper }
    before { StripeMock.start }
    after { StripeMock.stop }

    it "creates a charge in the queue" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        CreateChargeJob.perform_later(500, "test@example.com", "tok_1CIH3yH6rrVqTtkJalCXSCKF", "test")
      }.to enqueue_job
    end

    it "creates a charge now" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        CreateChargeJob.perform_now(500, "test@example.com", "tok_1CIH3yH6rrVqTtkJalCXSCKF", "test")
      }
    end
  end
end

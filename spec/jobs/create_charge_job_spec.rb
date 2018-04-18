require "rails_helper"

RSpec.describe CreateChargeJob, :type => :job do
  describe "#perform_later" do
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

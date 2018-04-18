require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "Relationships" do
    it { should have_many :gifts }
  end

  describe "Validations" do
    it { should validate_uniqueness_of :nps_id }
  end
end

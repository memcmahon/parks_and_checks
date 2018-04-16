require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "Relationships" do
    it { should have_many :gifts }
  end
end

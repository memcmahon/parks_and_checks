require 'rails_helper'

RSpec.describe Gift, type: :model do
  describe "Relationships" do
    it { should belong_to :user }
    it { should belong_to :image }
  end
end

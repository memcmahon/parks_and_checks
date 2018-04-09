require 'rails_helper'

describe "As a user" do
  describe "When they visit dashboard" do
    it "they can link to a park's site from an image" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      first(".image").click

    end
  end
end

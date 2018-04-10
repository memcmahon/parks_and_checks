require 'rails_helper'

describe "As a user" do
  describe "When they visit '/dashboard'" do
    it "they can select an image to make a payment" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      click_link("give", match: :first)

      expect(page).to have_content("Donate: $5.00")
    end
  end
end

require 'rails_helper'

describe "As a user" do
  describe "When they visit '/dashboard'" do
    it "they can select an image to make a payment" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      click_link("give", match: :first)

      expect(page).to have_content("Amount: $5.00")
      save_and_open_page

      click_on("submit")

      expect(page).to have_content("hlskdf")
    end
  end
end

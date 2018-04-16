require 'rails_helper'

describe "As a user" do
  describe "when I visit /gifts" do
    it "I can see a list of gifts that I have made" do
      user = create(:user)
      gifts = create_list(:gift, 5, user: user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/gifts'

      expect(page).to have_content("Total Donations: $25.00")

      within('.gifts') do
        expect(page).to have_css('.image', count: 5)
      end
    end
  end
end

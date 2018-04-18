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

    it "I can filter gifts by park" do
      user = create(:user)
      image = create(:image, park: "Yellowstone")
      gifts = create_list(:gift, 2, user: user, image: image)
      gifts = create_list(:gift, 3, user: user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/gifts?park=yellow'

      expect(page).to have_content("Total Donations: $25.00")

      within('.gifts') do
        expect(page).to have_content("Yellowstone", count: 1)
        expect(page).to_not have_content("JellyStone")
      end
    end
  end
end

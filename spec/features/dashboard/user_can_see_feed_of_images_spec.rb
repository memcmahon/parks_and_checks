require 'rails_helper'

describe "As a user" do
  describe "When they visit dashboard" do
    it "they see a feed of images of different national parks" do
      user = create(:user)
      images = create_list(:image, 20)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      within(".images") do
        expect(page).to have_css(".image", count: 20)
      end
    end

    it "they can filter by park" do
      user = create(:user)
      yellowstone_images = create_list(:image, 10, park: "Yellowstone")
      other_images = create_list(:image, 5)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      fill_in "park", with: "Yellowstone"

      within(".images") do
        expect(page).to have_content("Yellowstone", count: 10)
        expect(page).to_not have_content("Jellystone")
      end
    end
  end
end

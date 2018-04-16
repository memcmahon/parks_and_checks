require 'rails_helper'

describe "As a user" do
  describe "When they visit dashboard" do
    it "they see a feed of images of different national parks" do
      user = create(:user)
      images = create_list(:image, 20)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      # save_and_open_page

      within(".images") do
        expect(page).to have_css(".image", count: 20)
      end
    end
  end
end

require 'rails_helper'

describe 'As a User' do
  describe "'When I visit '/profile'" do
    it "I see my own information" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/profile'

      expect(page).to have_content("Name: #{user.name}")
      expect(page).to have_content("Email: #{user.email}")
    end
  end
end

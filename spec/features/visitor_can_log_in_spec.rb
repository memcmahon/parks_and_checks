require 'rails_helper'

describe "As a visitor" do
  describe "when they visit landing page" do
    it "they see the welcome message" do
      visit root_path

      expect(page).to have_content("Parks and Checks")
      expect(page).to have_content("Sign Up/Sign In")
      expect(page).to have_content("Park Login")
    end

    it "they can log in with google" do
      stub_omniauth
      visit root_path

      click_on "Sign Up/Sign In"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Currently logged in as Megan McMahon')
      expect(page).to have_content('logout')
    end

    def "they can log out" do
      stub_omniauth

      visit dashboard_path

      click_on "logout"

      expect(current_path).to equal('/')
      expect(page).to have_content('Sign Up/Sign In')
      expect(page).to_not have_content('logout')
    end

    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        provider: "google",
        uid: "12345678910",
        info: {
          email: "mcmahon.meganelizabeth@gmail.com",
          first_name: "Megan",
          last_name: "McMahon"
        },
        credentials: {
          token: "abcdefg12345",
          refresh_token: "12345abcdefg",
          expires_at: DateTime.now,
        }
      })
    end
  end
end
# When they visit '/'
# And click on Sign Up/Sign In
# And they authorize login with facebook
# Then they see 'Login Successful'
# And they see a feed of instagram posts by National Parks

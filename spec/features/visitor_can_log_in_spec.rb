require 'rails_helper'

describe "As a visitor" do
  describe "when they visit landing page" do
    it "they see the welcome message" do
      visit root_path

      expect(page).to have_content("Parks and Checks")
      expect(page).to have_content("Sign Up/Sign In")
      expect(page).to have_content("Park Login")
    end

    it "they can log in with facebook" do
      visit root_path

      click_on "Sign Up/Sign In"

    end

    def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: 'facebook',
  uid: '1234567',
  info: {
    email: 'mcmahon.meganelizabeth@gmail.com',
    name: 'Megan McMahon',
    first_name: 'Megan',
    last_name: 'McMahon',
    image: 'http://graph.facebook.com/1234567/picture?type=square',
    verified: true
  },
  credentials: {
    token: 'ABCDEF',
    expires_at: 1321747205,
    expires: true
  },
  extra: {
    raw_info: {
      id: '1234567',
      name: 'Joe Bloggs',
      first_name: 'Joe',
      last_name: 'Bloggs'
    }
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

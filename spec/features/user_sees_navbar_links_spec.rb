require 'rails_helper'

describe "As a user" do
  describe "they can navigate the website using navbar links" do
    before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/dashboard'
    end

    it "they can visit profile" do
      click_on "#{@user.name}"

      expect(current_path).to eq('/profile')
      expect(page).to have_link('Home')
      expect(page).to have_link('Favorites')
      expect(page).to have_link('Gifts')
      expect(page).to have_link('logout')
    end

    it "they can visit favorites" do
      click_on "Favorites"

      expect(current_path).to eq('/favorites')
      expect(page).to have_link('Home')
      expect(page).to have_link("#{@user.name}")
      expect(page).to have_link('Gifts')
      expect(page).to have_link('logout')
    end

    it "they can visit gifts" do
      click_on "Gifts"

      expect(current_path).to eq('/gifts')
      expect(page).to have_link('Home')
      expect(page).to have_link("#{@user.name}")
      expect(page).to have_link('Favorites')
      expect(page).to have_link('logout')
    end

    it "they can visit dashboard" do
      visit '/profile'

      click_on "Home"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_link('Gifts')
      expect(page).to have_link("#{@user.name}")
      expect(page).to have_link('Favorites')
      expect(page).to have_link('logout')
    end
  end
end

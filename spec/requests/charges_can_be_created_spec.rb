require 'rails_helper'

describe "charge creation" do
  it "charges can be created" do
    user = create(:user)
    image = create(:image)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    post "/charges?stripeEmail=#{user.email}&stripeToken=12345abcde&description=test&url=#{image.url}"

    expect(response.status).to eq(302)
  end
end

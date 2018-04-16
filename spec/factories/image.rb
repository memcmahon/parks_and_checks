FactoryBot.define do
  factory :image do
    park "JellyStone"
    park_url "jellystone.com"
    url "https://vignette.wikia.nocookie.net/cookieclicker/images/2/24/Capybara-02.jpg/revision/latest?cb=20130810045256"
    sequence(:nps_id) { |n| "#{n}" }
  end
end

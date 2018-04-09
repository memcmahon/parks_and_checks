class Image
  attr_reader :park, :credit, :alt_text, :title, :caption, :url, :park_url

  def initialize(park, park_url, info)
    @park = park
    @park_url = park_url
    @credit = info[:credit]
    @alt_text = info[:altText]
    @title = info[:title]
    @caption = info[:caption]
    @url = info[:url]
  end
end

class Image
  attr_reader :park, :credit, :alt_text, :title, :caption, :url

  def initialize(park, info)
    @park = park
    @credit = info[:credit]
    @alt_text = info[:altText]
    @title = info[:title]
    @caption = info[:caption]
    @url = info[:url]
  end
end

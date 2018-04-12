class ImageList
  attr_reader :images

  def initialize(info)
    @total = info[:total]
    @images = create_images(info[:data])
  end

  def create_images(info)
    images = info.map do |park|
      park[:images].map do |image|
        Image.create(park: park[:name],
                     park_url: park[:url],
                     credit: image[:credit],
                     alt_text: image[:altText],
                     title: image[:title],
                     caption: image[:caption],
                     url: image[:url],
                     nps_id: image[:id])
      end
    end.flatten
  end
end

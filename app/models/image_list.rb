class ImageList
  attr_reader :images

  def initialize(info)
    @total = info[:total]
    @images = create_images(info[:data])
  end

  def create_images(info)
    images = info.map do |park|
      park[:images].map do |image|
        if Faraday.get(image[:url]).status == 200
          Image.create(park: park[:name],
                       park_url: park[:url],
                       credit: image[:credit],
                       alt_text: image[:altText],
                       title: image[:title],
                       caption: image[:caption],
                       url: Cloudinary::Uploader.upload(image[:url], transformation: [{:width=>500}])["secure_url"],
                       nps_id: image[:id])
        end
      end
    end.flatten
  end
end

class ImageList
  attr_reader :images, :total

  def initialize(info)
    @total = info[:total]
    @images = create_images(info[:data])
  end

  def create_images(info)
    images = info.map do |park|
      park[:images].map do |image|
        unless Image.find_by(nps_id: image[:id])
          url = begin
                  Cloudinary::Uploader.upload(image[:url], transformation: [{width: 1000, crop: :fit}])["secure_url"]
                rescue CloudinaryException
                  next
                end

          Image.create(park: park[:name],
                       park_url: park[:url],
                       credit: image[:credit],
                       alt_text: image[:altText],
                       title: image[:title],
                       caption: image[:caption],
                       url: url,
                       nps_id: image[:id])
       end
      end
    end.flatten
  end
end

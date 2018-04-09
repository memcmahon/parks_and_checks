class ImageList
  attr_reader :images

  def initialize(info)
    @total = info[:total]
    @images = create_images(info[:data])
  end

  def create_images(info)
    images = info.map do |park|
      park[:images].map do |image|
        Image.new(park[:name], park[:url], image)
      end
    end.flatten
  end
end

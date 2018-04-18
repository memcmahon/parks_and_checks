class ImageSearchService
  def initialize(parkcode = "all")
    @parkcode = parkcode
  end

  def self.search(parkcode = "all")
    raw = new(parkcode).get_images(parkcode)
    ImageList.new(raw).images
  end

  def get_images(parkcode)
    conn = Faraday.new("https://developer.nps.gov/api/v1/parks")

    response = conn.get do |req|
      req.params["api_key"] = ENV["NPS_API_KEY"]
      if parkcode == "all"
        req.params["parkcode"] = File.read("./app/data/parkcodes.csv")
      else
        req.params["parkcode"] = parkcode
      end
      req.params["fields"] = "images"
      req.headers["Accept"] = "application/json"
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end

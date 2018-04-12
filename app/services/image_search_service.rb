class ImageSearchService
  def initialize(parkcode = "all")
    @parkcode = parkcode
  end

  def self.search
    raw = new.get_images
    ImageList.new(raw).images
  end

  def get_images
    conn = Faraday.new("https://developer.nps.gov/api/v1/parks")

    response = conn.get do |req|
      req.params["api_key"] = ENV["NPS_API_KEY"]
      req.params["parkcode"] = File.read("./app/data/parkcodes.csv")
      req.params["fields"] = "images"
      req.headers["Accept"] = "application/json"
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end

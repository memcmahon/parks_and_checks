require 'rails_helper'

RSpec.describe ImageList, type: :model do
  describe "Functionality" do
    it "can create image list" do
      raw_data = { :total=>2,
                   :data=>
                    [{:url=>"https://www.nps.gov/acad/index.htm",
                      :name=>"Acadia",
                      :description=>
                       "Acadia National Park protects the natural beauty of the highest rocky headlands along the Atlantic coastline of the United States, an abundance of habitats with high biodiversity, clean air and water, and a rich cultural heritage. Each year, more than 3.3 million people explore seven peaks above 1,000 feet, 158 miles of hiking trails, and 45 miles of carriage roads with 16 stone bridges.",
                      :images=>
                       [{:credit=>"NPS / Kristi Rugg",
                         :altText=>"Large puffy clouds dot a brilliant blue sky as wave crash against the rocky coastline of Acadia.",
                         :title=>"Acadia's rocky coastline",
                         :id=>481,
                         :caption=>"Millions of people come to Acadia for our distinctive rocky coastline.",
                         :url=>"https://www.nps.gov/common/uploads/structured_data/3C7B45AE-1DD8-B71B-0B7EE131C7DFC2F5.jpg"},
                        {:credit=>"NPS / Kristi Rugg",
                         :altText=>"Hiking tracks carved through three feet of snow wind through a heavy snow-laden forest.",
                         :title=>"Heavy snow-laden trees",
                         :id=>485,
                         :caption=>"During the colder months snows transform our landscape into a winter wonderland.",
                         :url=>"https://www.nps.gov/common/uploads/structured_data/3C7B4BEC-1DD8-B71B-0B2CF833F93140FF.jpg"}]},
                     {:url=>"https://www.nps.gov/arch/index.htm",
                      :name=>"Arches",
                      :description=>
                       "Visit Arches to discover a landscape of contrasting colors, land forms and textures unlike any other in the world. The park has over 2,000 natural stone arches, in addition to hundreds of soaring pinnacles, massive fins and giant balanced rocks. This red-rock wonderland will amaze you with its formations, refresh you with its trails, and inspire you with its sunsets.",
                      :images=>
                       [{:credit=>"NPS/Neal Herbert",
                         :altText=>"a stone monolith reflected in standing water",
                         :title=>"The Organ with Potholes",
                         :id=>163,
                         :caption=>"The Organ rock formation is reflected in one of many natural potholes.",
                         :url=>"https://www.nps.gov/common/uploads/structured_data/3C79850F-1DD8-B71B-0BC4A88BA85DE6B0.jpg"},
                        {:credit=>"NPS/Herbert",
                         :altText=>"two hikers descend a broad wash with tall rock walls on either side.",
                         :title=>"Park Avenue Trail",
                         :id=>273,
                         :caption=>"The Park Avenue trail is one of many hiking trails at Arches, ranging from easy to strenuous.",
                         :url=>"https://www.nps.gov/common/uploads/structured_data/3C7A0DE5-1DD8-B71B-0BFBE720788EF4A3.jpg"}]}]}

      list = ImageList.new(raw_data)

      expect(list.images).to be_instance_of Array
      expect(list.total).to eq(2)

      list.images.each do |image|
        expect(image).to be_instance_of Image
      end
    end

    it "will not create images where links are broken" do
      raw_data = { :total=>1,
                   :data=>
                    [{:url=>"https://www.nps.gov/acad/index.htm",
                      :name=>"Acadia",
                      :description=>
                       "Acadia National Park protects the natural beauty of the highest rocky headlands along the Atlantic coastline of the United States, an abundance of habitats with high biodiversity, clean air and water, and a rich cultural heritage. Each year, more than 3.3 million people explore seven peaks above 1,000 feet, 158 miles of hiking trails, and 45 miles of carriage roads with 16 stone bridges.",
                      :images=>
                       [{:credit=>"NPS / Kristi Rugg",
                         :altText=>"Large puffy clouds dot a brilliant blue sky as wave crash against the rocky coastline of Acadia.",
                         :title=>"Acadia's rocky coastline",
                         :id=>481,
                         :caption=>"Millions of people come to Acadia for our distinctive rocky coastline.",
                         :url=>"https://www.nps.gov/common/uploads/structured_data/3C7B45AE-1D D8-B71B-0B7EE131C7DFC2F5.jpg"}]}]}

      list = ImageList.new(raw_data)

      expect(list.images.empty?)
    end
  end
end

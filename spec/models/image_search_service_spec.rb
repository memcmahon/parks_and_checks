require 'rails_helper'

describe "ImageSearchService" do
  describe "api call" do
     it "gets images" do
       VCR.use_cassette 'image_search' do
          response = ImageSearchService.new.get_images("all")

          expect(response[:total]).to eq(50)
          response[:data].each do |park|
            expect(park[:states])
            expect(park[:url])
            expect(park[:name])
            expect(park[:images])
            expect(park[:images]).to be_instance_of Array
            expect(park[:images][0][:credit])
            expect(park[:images][0][:altText])
            expect(park[:images][0][:title])
            expect(park[:images][0][:id])
            expect(park[:images][0][:caption])
            expect(park[:images][0][:url])
          end
       end
     end

     it "gets and creates images" do
       VCR.use_cassette 'image_search_and_create' do
         response = ImageSearchService.search('ZION')

         expect(response).to be_instance_of Array
         response.each do |item|
           expect(item).to be_instance_of Image
         end
         expect(response.count).to eq(5)
       end
     end
  end
end

require 'sidekiq-scheduler'

class ImageGrabber
  include Sidekiq::Worker

  def perform
    ImageSearchService.search
  end
end

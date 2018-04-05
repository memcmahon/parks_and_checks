class DashboardController < ApplicationController
  def index
    @images = ImageSearchService.search.sample(20)
  end
end

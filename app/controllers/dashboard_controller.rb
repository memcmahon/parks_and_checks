class DashboardController < ApplicationController
  def index
    @images = Image.all.sample(20)
  end
end

class DashboardController < ApplicationController
  def index
    if params[:park]
      @images = Image.where(park: params[:park])
    else
      @images = Image.all.sample(20)
    end
  end
end

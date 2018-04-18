class DashboardController < ApplicationController
  def index
    @images = ImagePresenter.images(params[:park])
  end
end

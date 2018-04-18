class GiftsController < ApplicationController
  def index
    @gifts = GiftPresenter.new(current_user, params[:park])
  end
end

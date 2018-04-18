class GiftsController < ApplicationController
  def index
    @total_donations = GiftPresenter.total_donations(current_user)
  end
end

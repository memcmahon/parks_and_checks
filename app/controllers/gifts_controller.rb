class GiftsController < ApplicationController
  def index
    cents_donated = current_user.gifts.pluck(:amount).sum
    @total_donations = ActionController::Base.helpers.number_to_currency(cents_donated/100)
  end
end

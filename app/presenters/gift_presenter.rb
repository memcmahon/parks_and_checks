class GiftPresenter
  def self.total_donations(user)
    ActionController::Base.helpers.number_to_currency(user.gifts.pluck(:amount).sum/100)
  end
end

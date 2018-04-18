class GiftPresenter
  def initialize(user, park = nil)
    @user = user
    @park = park
  end

  def total_donations
    ActionController::Base.helpers.number_to_currency(@user.gifts.pluck(:amount).sum/100)
  end

  def gift_array
    if !@park.nil?
      @user.gifts.joins(:image).select("images.*, gifts.*").where("images.park ILIKE ?", "%#{@park}%").order("RANDOM()").to_a.uniq do |gift|
          gift.image_id
        end
    else
      @user.gifts.order("RANDOM()").to_a.uniq do |gift|
          gift.image_id
        end
    end
  end

  def all
    @user.gifts
  end
end

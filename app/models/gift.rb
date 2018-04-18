class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :image

  def self.total_amount(image_id)
    dollar_amount(where(image_id: image_id).sum(:amount))
  end

  private

    def self.dollar_amount(amount)
      ActionController::Base.helpers.number_to_currency(amount/100)
    end
end

class CreateChargeJob < ApplicationJob
  queue_as :default

  def perform(amount, email, source, description)
    customer = Stripe::Customer.create(
      :email => email,
      :source => source
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => amount,
      :description => description,
      :currency => 'usd'
    )
  end
end

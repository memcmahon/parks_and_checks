class ChargesController < ApplicationController
  def new
    @description = params[:park]
  end

  def create
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => params[:description],
      :currency => 'usd'
    )

    redirect_to dashboard_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

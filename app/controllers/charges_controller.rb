class ChargesController < ApplicationController
  def new
    @description = params[:park]
  end

  def create
    CreateChargeJob.perform_later(500, params[:stripeEmail], params[:stripeToken], params[:description])

    redirect_to dashboard_path

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  end
end

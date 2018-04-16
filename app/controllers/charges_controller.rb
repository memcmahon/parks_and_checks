class ChargesController < ApplicationController
  def new
    @description = params[:park]
    @image_url = params[:url]
  end

  def create
    CreateChargeJob.perform_later(500, params[:stripeEmail], params[:stripeToken], params[:description])

    image = Image.find_by(url: params[:url])
    current_user.gifts.create(image: image, amount: 500)

    redirect_to dashboard_path

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  end
end

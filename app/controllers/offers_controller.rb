class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end
  def create
    offer = Offer.create(orders_params)

    if offer.valid?
      redirect_to(offers_path, notice: 'Offer created!')
    else
      redirect_to(new_offer_path, alert: offer.errors.messages)
    end
  end
  def destroy
    Offer.find(params[:id]).destroy

    redirect_to(offers_path, notice: "Offer removed")
  end  

  private
  def orders_params
    params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium)
  end
  
end
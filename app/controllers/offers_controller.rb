class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end
  def create
    offer = Offer.create(offers_params)

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
  def show
    @offer = Offer.find(params[:id])
  end
  def update
    offer = Offer.find(params[:id])
    if offers_params
      offer.update(offers_params)
    else
      offer.update(enabled: !offer.enabled)
    end

    redirect_to(offers_path, notice: "Offer updated")
  end  

  private
  def offers_params
    if params[:offer]
      params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium)
    else
      return false
    end
  end
  
end
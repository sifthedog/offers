class UsersController < ApplicationController
  def index
    @offers = Offer.where(enabled: true).order('premium DESC')
  end
end
class Offer < ApplicationRecord
  validates(:advertiser_name, uniqueness: { message: 'Advertiser must be unique' })
  validates(:advertiser_name, presence: { message: 'Advertiser must be present' })
  validates(:starts_at, presence: { message: 'Starts at must be present' })
  validates(:description, presence: { message: 'Description must be present' })
  
  validates_with(OfferValidator, fields: [:url, :description])
end

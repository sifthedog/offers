class Offer < ApplicationRecord
  validates(:advertiser_name, uniqueness: { message: 'Advertiser must be unique' })
  validates(:advertiser_name, presence: { message: 'Advertiser must be present' })
  validates(:starts_at, presence: { message: 'Starts at must be present' })
  validates(:description, presence: { message: 'Description must be present' })
  
  validates_with(OfferValidator, fields: [:url, :description])

  def get_status
    if enabled
      current_time = Time.current.to_i
      if current_time >= starts_at && ends_at.nil? 
        return true
      elsif current_time >= starts_at && current_time <= ends_at
        return true
      else
        return false
      end
    else
      return enabled
    end
  end  
end

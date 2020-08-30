class OfferValidator < ActiveModel::Validator
  require 'uri'

  def validate(record)
    unless record.url =~ URI::regexp      
      record.errors[:url] << 'This is not a valid URL'
    end 
    unless (record.description.nil? || record.description.size <= 500)
      record.errors[:description] << 'Description must not exceed 500 chars.'
    end
  end  
end
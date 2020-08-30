require "rails_helper"

describe Offer, type: :model do
  context 'guarantee validation' do
    it { is_expected.to validate_presence_of(:advertiser_name).with_message(/Advertiser must be present/) }
    it { is_expected.to validate_uniqueness_of(:advertiser_name).with_message(/Advertiser must be unique/) }
    it { is_expected.to validate_presence_of(:starts_at).with_message(/Starts at must be present/) }
    it { is_expected.to validate_presence_of(:description).with_message(/Description must be present/) }
    it 'validates given uri' do
      offer = Offer.new(
        url: '12345',
        advertiser_name: 'Hakuna',
        starts_at: 0,
        ends_at: 1,
        premium: false,
        description: 'Testing'
      )
      expect(offer.valid?).to be_falsey
      expect(offer.errors.messages[:url]).to eq(['This is not a valid URL'])
    end
    it 'validates description length' do
      offer = Offer.new(
        url: 'http://test.com',
        advertiser_name: 'Hakuna',
        starts_at: 0,
        ends_at: 1,
        premium: false,
        description: 'a' * 501
      )

      expect(offer.valid?).to be_falsey
      expect(offer.errors.messages[:description]).to eq(['Description must not exceed 500 chars.'])
    end
    
  end  
end
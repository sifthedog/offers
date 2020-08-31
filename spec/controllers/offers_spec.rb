# frozen_string_literal: true
require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  describe 'create' do
    context 'with missing attributes' do
      before do
        post :create, params: { offer: offer_attributes_missing }
      end
  
      let(:offer_attributes_missing) do
        { advertiser_name: 'Teste', description: 'Blank', ends_at: 1 }
      end
  
      let(:offer) { double(Offer, advertiser_name: 'Teste', description: 'Blank', starts_at: 1, ends_at: 1) }
  
      context 'service creation fails' do
  
        it { expect(response).to be_redirect }
        it { expect(flash[:alert]).to be_present }
      end
    end

    context 'with valid attributes' do
      before do
        post :create, params: { offer: offer_attributes }
      end
      
      let(:offer_attributes) do
        { advertiser_name: 'Teste', description: 'Blank', starts_at: 0, url: 'http://teste.com', ends_at: 1 }
      end

        it { expect(response).to be_redirect }
        it { expect(flash[:notice]).to be_present }
    end
  end
end

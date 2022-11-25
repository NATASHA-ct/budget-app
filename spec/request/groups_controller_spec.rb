require 'rails_helper'

RSpec.describe GroupsController, type: :request do
  describe "GET './index' page" do
    before(:all) do
      @address = get '/groups'
    end

    it 'it should return a valid status' do
      expect(@address).to eq(302)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/groups/show'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/groups/new'
      expect(response).to have_http_status(302)
    end
  end
end

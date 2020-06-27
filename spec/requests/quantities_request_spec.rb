require 'rails_helper'

RSpec.describe "Quantities", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/quantities/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/quantities/new"
      expect(response).to have_http_status(:success)
    end
  end

end

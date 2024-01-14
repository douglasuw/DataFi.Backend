require 'rails_helper'

RSpec.describe "Auths", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/auth/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /signup" do
    it "returns http success" do
      get "/auth/signup"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /home" do
    it "returns http success" do
      get "/auth/home"
      expect(response).to have_http_status(:success)
    end
  end

end

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET#index" do
    it "should have a success http response for non signed_in user" do
      get :index
      expect(response).to have_http_status :success
    end
  end
end
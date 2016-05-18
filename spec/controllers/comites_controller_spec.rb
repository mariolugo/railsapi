require 'rails_helper'

RSpec.describe ComitesController, type: :controller do

  describe "GET #api/comites" do
    it "returns http success" do
      get :api/comites
      expect(response).to have_http_status(:success)
    end
  end

end

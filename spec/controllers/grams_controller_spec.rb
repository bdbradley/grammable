require 'rails_helper'

RSpec.describe GramsController, type: :controller do
  describe "grams#index action" do 
    it "should successfully show the page" do
      #triggers an HTTP get request, which we want as part of the test
      get :index
      #if has http get then success
      expect(response).to have_http_status(:success)
    end
  end
end


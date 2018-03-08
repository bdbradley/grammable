require 'rails_helper'

RSpec.describe GramsController, type: :controller do
  describe "grams#index action" do 
    it "should successfully show the page" do
      #triggers an HTTP get request for the index action, which we want as part of the test
      get :index
      #if has http get then success
      expect(response).to have_http_status(:success)
    end
  end


  describe "grams#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do
      user = User.create(
        email:                  'fakeuser@gmail.com',
        password:               'secretPassword',
        password_confirmation:  'secretPassword'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "grams#create action" do
    it "should require users to be logged in" do
      post :create, params: { gram: { message: "Hello" }}
      expect(response).to redirect_to new_user_session_path
    end
    
    it "should successfully create a new gram in our database" do
      user = User.create(
        email:                  'fakeuser@gmail.com',
        password:               'secretPassword',
        password_confirmation:  'secretPassword'
      )
      sign_in user

      post :create, params: { gram: { message: 'Hello!' } }
      expect(response).to redirect_to root_path

      gram = Gram.last
      expect(gram.message).to eq("Hello!")
      expect(gram.user).to eq(user)
    end

    #prevents blank grams from entering db
    it "should properly deal with validation errors" do
      user = User.create(
        email:                  'fakeuser@gmail.com',
        password:               'secretPassword',
        password_confirmation:  'secretPassword'
      )
      sign_in user

      gram_count = Gram.count
      #triggers httpp post request but leaves blank string in message to test?
      #this is for create action in grams controller
      post :create, params: { gram: { message: ''}}
      #HTTP status should be unprocessable_entity
      expect(response).to have_http_status(:unprocessable_entity)
      #The grams should be zero
      expect(Gram.count).to eq Gram.count
    end
  end
end

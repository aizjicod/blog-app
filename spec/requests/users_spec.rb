require "rails_helper"

RSpec.describe "Users response", :type => :request do
  describe "/users" do
    before(:example) { get '/users' }

    it "get /users has correct status" do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end
  
    it "get /users renders correct template" do
      expect(response).to render_template(:index)
    end
    it "get /users renders correct body" do 
      expect(response.body).to include("this is a list of users")
    end
    
    it "does not render a different template" do
      expect(response).to_not render_template(:show)
    end
  end
  
  describe "/users/id" do
    before(:example) {get "/users/:id"}

    it "get /users/1 has correct status" do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end
  
    it "get /users/1 renders correct template" do
      expect(response).to render_template(:show)
    end
    it "get /users/1 renders correct body" do 
      expect(response.body).to include("this page shows the user information")
    end
    
    it "does not render a different template" do
      expect(response).to_not render_template(:index)
    end
  end
end
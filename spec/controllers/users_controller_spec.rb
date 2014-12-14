require 'rails_helper'

describe UsersController do
  describe "#new" do
    it "should allow users to sign up for the page" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "#create" do
    it "should create a new User" do
      expect {
        post :create, { user: {username: "Professional Name", password: "AlexDakotaChrisDmitriy"}}
      }.to change(User, :count).by(1)
    end
  end
end

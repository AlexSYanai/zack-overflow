require 'rails_helper'

describe UsersController do
  describe "POST with parameters" do
    context "with valid parameters" do
      it "should create a new User" do
        expect {
          post :create, { user: {username: "King Murok", password: "fuckyeah"}}
        }.to change(User, :count).by(1)
      end
    end
  end
end
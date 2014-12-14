require 'rails_helper'

describe User do
  describe "User#initialize" do
    before :each do
      @user = User.new(username: "UnProffesionalNameChoice", password: "Dakota")
    end

    # it "initializes a User class with a default status of User" do
    #   expect(@user.is_admin).to be(false)
    # end
    # .is_admin is undefined <-- Need to fix

    it "is valid with a username and a password" do
      expect(@user).to be_valid
    end
  end
end

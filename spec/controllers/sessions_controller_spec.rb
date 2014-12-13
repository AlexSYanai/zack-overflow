require 'rails_helper'

describe SessionsController do
<<<<<<< HEAD
  subject { post :create, session: { username: "fake_user", password: "dfsdfasdfasdf" } }

  it "should send a invalid login request back to the login page" do
    expect(subject).to render_template(:new)
=======
  describe "GET /logout" do
    it "should logout the current user" do
      User.create(username: "name", password: 'password')
      delete :destroy
      session[:user_id].should be_nil
      response.should redirect_to(root_path)
    end
>>>>>>> ac9e3484b19faabd3b8276151a7b9642d7786e6f
  end
end

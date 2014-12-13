require 'rails_helper'

describe SessionsController do
  subject { post :create, session: { username: "fake_user", password: "dfsdfasdfasdf" } }

  it "should send a invalid login request back to the login page" do
    expect(subject).to render_template(:new)
  end
end

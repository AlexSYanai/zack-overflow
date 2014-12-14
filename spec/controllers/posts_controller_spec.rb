require 'rails_helper'

describe PostsController do
  let(:test_user) {FactoryGirl.create :user}
  let(:test_post) {FactoryGirl.create :post}

  describe "#index" do
    it "adds a post to a list of all posts" do
      get :index
      expect(response).to be_success
    end
  end

  describe "#create" do
    it "creates the post if valid params" do
      session[:user_id] = test_user.id
      expect {
        post :create,
        :post => { title: 'my title', content: 'my content' }
      }.to change { Post.count }.by(1)
    end
  end

end

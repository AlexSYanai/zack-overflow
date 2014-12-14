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

end

require 'rails_helper'

describe Category do
  before :each do
    @category = Category.new(title:"Snowboards")
  end

  before :each do
    @user = User.new(username:"Zacky", password:"muffins")
  end

  describe "Category#posts" do
    before :each do
      @post1 = Post.new(content: "This Guy", creator_id: @user.id, category_id: @category.id)
    end

    # it "Has a post object" do
    #   expect(@category.posts[0]).to be_kind_of(Post)
    # end
  end
end
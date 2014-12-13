require 'rails_helper'

describe CategoriesController do
  describe 'GET #new' do
    it 'assigns a new Category to @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #all' do
    it 'assigns all categories to @categories' do
      get :all
      expect(assigns(:categories)).to be_a ActiveRecord::Relation
    end
  end
end

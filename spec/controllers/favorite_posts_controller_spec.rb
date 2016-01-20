require 'rails_helper'

RSpec.describe FavoritePostsController, type: :controller do
  
  describe "POST #create" do

    before do
      @user_1 = FactoryGirl.create(:user)
      @user_2 = FactoryGirl.create(:user)
      @sahdf = FactoryGirl.create(:post, user: @user_1)
      request.env["HTTP_REFERER"] = root_path
      allow(controller).to receive(:params).and_return( @sahdf )
    end
  	
    context "with valid attributes" do
  		it "creates a new favorite" do
        allow(controller).to receive(:current_user) { @user_2 }
  			expect{ post :create }.to change(Favorite, :count).by(1)
  		end

      it "redirects back" do
        allow(controller).to receive(:current_user) { @user_2 }
        post :create
        expect(response.status).to eq(302)
      end
  	end

  	context "with invalid attributes" do
  		it "doesn't create a favorite" do
  			expect{ post :create }.to_not change(Favorite, :count)
  		end
  	end

  end

  describe "DELETE #destroy" do

    before do
      @favorite = FactoryGirl.create(:favorite)
      allow(controller).to receive(:params).and_return( @favorite.favorited )
      allow(controller).to receive(:current_user) { @favorite.user }
      request.env["HTTP_REFERER"] = root_path
    end

    it "deletes the favorite" do
      expect{ delete :destroy, id: @favorite }.to change(Favorite, :count).by(-1)
    end

    it "redirects back" do
      delete :destroy, id: @favorite
      expect(response.status).to eq(302)
    end

  end

end
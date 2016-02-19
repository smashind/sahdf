require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "POST #create" do

    before do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post)
      request.env["HTTP_REFERER"] = post_path(@post)
    end

    def valid_attributes
      { :body => "Good post!", :user_id => @user.id }
    end

    def invalid_attributes
      { :body => nil, :user_id => @user.id }
    end

    context "with valid attributes" do
      it "creates a new comment" do
        allow(controller).to receive(:current_user) { @user }
        post :create, post_id: @post.id, comment: valid_attributes
        expect(Comment.count).to eq(1)
      end
    end

    context "with invalid attributes" do
      it "doesn't create a new comment" do
        allow(controller).to receive(:current_user) { @user }
        post :create, post_id: @post.id, comment: invalid_attributes
        expect(Comment.count).to eq(0)
      end
    end
  end

end

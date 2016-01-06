require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  describe "GET #index" do
  	it "shows the most recent Featured posts" do
  		featuredPost = FactoryGirl.create(:post, :featured)
  		regularPost = FactoryGirl.create(:post)
  		get :index
  		expect(assigns(:posts)).to eq([featuredPost])
  	end
  end

end
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  describe "GET #index" do
  	it "shows the most recent posts" do
  		post = FactoryGirl.create(:post)
  		get :index
  		expect(assigns(:posts)).to eq([post])
  	end
  end

end
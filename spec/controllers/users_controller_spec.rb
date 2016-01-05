require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "GET #show" do
  	it "shows the user's page" do
  		user = FactoryGirl.create(:user)
  		get :show, id: user.id
  		expect(assigns(:user)).to eq(user)
  	end
  end

end
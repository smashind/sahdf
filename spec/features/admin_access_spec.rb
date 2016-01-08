require 'rails_helper'

describe 'Accessing the admin area' do

	context "while not logged in" do

		it "redirects to the login page" do
			visit admin_root_path
			expect(current_path).to eq(new_user_session_path)
		end
  end

  context "while logged in as a non admin" do
    let(:user) { FactoryGirl.create(:user) }
  	
  	it "redirects to the home page" do
      sign_in user
      visit admin_root_path
      expect(current_path).to eq(root_path)
    end
  end

  context "while logged in as an admin" do
  	let(:admin_user) { FactoryGirl.create(:user, :admin) }

  	it "shows the admin area" do
  		sign_in admin_user
  		visit admin_root_path
  		expect(current_path).to eq(admin_root_path)
  	end
  end
end
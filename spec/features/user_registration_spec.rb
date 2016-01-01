require 'rails_helper'

describe 'User pages' do

  subject { page }

	describe 'user registration', js: true do
		before(:each) do
			visit new_user_registration_path
			fill_in "user_name", with: "Gary"
			fill_in "user_email", with: "example@example.org"
			fill_in "user_password", with: "password"
		end

		it "should be valid" do
			expect { click_button "Sign up" }.to change(User, :count).by(1)
		end
		
	end

	let(:user) { FactoryGirl.create(:user) }

  describe "user login" do 

  	it "should redirect to the user's page" do 
  		sign_in user
  		expect(current_path).to eq(user_path(user))
  	end
  end

end
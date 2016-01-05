require 'rails_helper'

describe 'Posting a sadf' do

  subject { page }

	describe 'with no post body', js: true do

		it "fails and shows the errors" do
		  visit root_path
		  click_link 'Post a sad funny'
		  find("#post-form").click_button('Post it')
		  expect(page).to have_css('.has-error')
		  expect(page).to have_content "Body can't be blank. Body is too short (minimum is 2 characters)."
		end

	end

	let!(:anon) { FactoryGirl.create(:user, :anonymous) }

  describe "when not logged in", js: true do

		it "gets submitted by anonymous" do
			visit root_path
		  click_link 'Post a sad funny'
		  find("#post-form").fill_in('post_body', with: 'Today I had a very busy day')
		  click_button 'Post it'
		  expect(page).to_not have_css('.has-error')
		end
	end

	let(:user) { FactoryGirl.create(:user) }

	describe "when logged in", js: true do

		it "gets submitted successfully" do
			sign_in user
			visit root_path
		  click_link 'Post a sad funny'
		  find("#post-form").fill_in('post_body', with: 'Today I had a very busy day')
		  click_button 'Post it'
		  expect(page).to_not have_css('.has-error')
		end
	end

end
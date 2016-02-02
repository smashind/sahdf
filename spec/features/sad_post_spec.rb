require 'rails_helper'

describe 'Posting a sadf' do

  subject { page }

	describe 'with no post body' do

		it "fails and shows the errors" do
		  visit root_path
		  find(".new-post-home").click
		  find("#new_post").click_button('Post it')
		  expect { click_button 'Post it' }.to_not change(Post, :count)
		end

	end

	let!(:anon) { FactoryGirl.create(:user, :anonymous) }

  describe "when not logged in but with valid attributes" do

		it "gets submitted by anonymous" do
			visit root_path
		  page.find(".new-post-home").click
		  find("#new_post").fill_in('form_post_body', with: 'Today I had a very busy day')
		  expect { click_button 'Post it' }.to change(Post, :count).by(1)
		end
	end

	let(:user) { FactoryGirl.create(:user) }

	describe "when logged in with valid attributes" do

		it "gets submitted successfully" do
			sign_in user
			visit root_path
		  page.find('.new-post-home').click
		  find("#new_post").fill_in('form_post_body', with: 'Today I had a very busy day')
		  expect { click_button 'Post it' }.to change(Post, :count).by(1)
		end
	end

end
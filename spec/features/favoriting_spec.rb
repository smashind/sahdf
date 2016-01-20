require 'rails_helper'

describe 'Favoriting a sadf' do

	let!(:user) { FactoryGirl.create(:user) }
	let!(:post) { FactoryGirl.create(:post, user_id: user.id, featured: true) }

	context 'is not possible' do
		it "when not logged in" do
			visit root_path
			expect(page).to_not have_selector(".favorite-button")
		end

		it "on user's own sadf" do
			sign_in user
			visit root_path
			expect(page).to_not have_selector(".favorite-button")
		end
	end

	let(:user_2) { FactoryGirl.create(:user) }

	context 'is possible' do
    it "when logged in on other user's post" do
    	sign_in user_2
		  visit root_path
      expect(page).to have_selector(".favorite-button")
    end
  end

  context 'favoriting and unfavoriting' do
  	before(:each) do
  		sign_in user_2
		  visit root_path
		end
  	
  	it "is favorited when the favorite button is clicked" do
  		expect { click_link "Favorite" }.to change(Favorite, :count).by(1)
  	end

  	it "shows on the user's page after being favorited" do
      click_link "Favorite"
  		visit user_path(user_2.id)
  		expect(page).to have_content("Today my son destroyed my Gunnar optiks.")
  	end

  	it "can be unfavorited" do
  		click_link "Favorite"
  		expect { click_link "Unfavorite" }.to change(Favorite, :count).by(-1)
  	end

  	it "doesn't show on user's page after unfavoriting" do
  		click_link "Favorite"
  		click_link "Unfavorite"
  		visit user_path(user_2.id)
  		expect(page).to_not have_content("Today my son destroyed my Gunnar optiks.")
  	end
  end

end
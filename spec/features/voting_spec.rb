require 'rails_helper'

RSpec.feature do

  before do
  	@post = FactoryGirl.create(:post, featured: true)
  	visit root_path
  end

	describe "Making a sad vote" do 

		it "increases the sad vote count by 1" do
			page.find(".sad-vote", text: "This is Sad (0)").click
			expect(page).to have_content("Voted sad!")
		end
	end

  describe "Making a funny vote" do

    it "increases the funny vote count by 1" do
      page.find(".funny-vote", text: "This is Funny (0)").click
			expect(page).to have_content("Voted funny!")
    end
  end

end

require 'rails_helper'

RSpec.describe "pages/home.html.erb", :type => :view do

	it 'renders an <h1> tag' do
		render
		expect(rendered).to have_selector('h1')
	end
  
end

FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "User#{n}" }
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"
	end

	factory :post do
	  body "Today my son destroyed my Gunnar optiks."
	  user
	end
end
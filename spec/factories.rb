FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "User#{n}" }
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"

		trait :anonymous do
			name "Anonymous"
		end
	end

	factory :post do
	  body "Today my son destroyed my Gunnar optiks."
	  user
	end
end
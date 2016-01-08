FactoryGirl.define do  factory :role do
    name "MyString"
  end

	factory :user do
		sequence(:name) { |n| "User#{n}" }
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"

		trait :anonymous do
			name "Anonymous"
		end

		trait :admin do
			role "admin"
		end
	end

	factory :post do
	  body "Today my son destroyed my Gunnar optiks."
	  user

	  trait :featured do
	  	featured true
	  end
	end
end
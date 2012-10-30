FactoryGirl.define do
	factory :user do
		first_name "Michael"
		last_name  "Hartl"
		nickname "mhart"  
		full_name     "Michael Hartl"
		email    "michael@example.com"
		password "foobar"
		password_confirmation "foobar"
	end 
end
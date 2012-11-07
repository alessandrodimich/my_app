# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  nickname   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  full_name  :string(255)
#

require 'spec_helper'

describe User do
	
	before do
		@user = User.new(first_name: "Example User", last_name: "Example User", nickname: "ExaUse",email: "user@example.com", password: "foobar", password_confirmation: "foobar") 
	end
	
	subject { @user }
	
	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:nickname) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
    it { should respond_to(:authenticate) } 


	it { should be_valid }

	describe "when first name is not present" do
		before { @user.first_name = " " }
		it { should_not be_valid }
	end

	describe "when last name is not present" do
		before { @user.last_name = " " }
		it { should_not be_valid }
	end

	describe "when nickname is not present" do
		before { @user.nickname = " " }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup  #creates a duplicate user with the same attributes
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end
		it { should_not be_valid }
	end

	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = " "}
		it { should_not be_valid }
	end

	describe "when  password doesn't match password_confirmation" do
		before { @user.password = "mismatch" }
		it { should_not be_valid }
	end

	describe "when  password password_confirmation is nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "return value of the authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by_email(@user.email) }

		describe "with valid password" do
			it { should == found_user.authenticate(@user.password) }	
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

			it { should_not == user_for_invalid_password }
			specify { user_for_invalid_password.should be_false}
		end
	end

	describe "with a password that is too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end

	describe "remember token" do
    	before { @user.save }
    its(:remember_token) { should_not be_blank }
  	end

end

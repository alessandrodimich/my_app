require 'spec_helper'
describe Micropost do
	let(:user) { FactoryGirl.create(:user) }
	
	before { @micropost = user.microposts.build(content: "Lorem ipsum") }
  
  	subject { @micropost }
  	
  	it { should respond_to(:content) }  # it indicates that it should have a content
  	it { should respond_to(:user_id) }  # it indicates that it should have a user_id
  	it { should respond_to(:user) }  # it indicates that it should have a user
  	its(:user) { should == user }

  	it { should be_valid }

  	describe "When user is not present" do
  		before { @micropost.user_id = nil }
  		it { should_not be_valid }
  	end

  	describe "accessible attributes" do
  		# This test verifies that calling Micropost.new with a nonempty 
  		# user_id raises a mass assignment security error exception
  		it "should not allow access to user_id" do
  			expect do
  				Micropost.new(user_id: user.id)
  			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  		end 
  	end

end
require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }
    it { should have_selector('h1',    text: 'Sign up') }
    it {should have_selector('title', text: 'Sign up')}
  end

  describe "profile page" do
  	let(:factory_user) {FactoryGirl.create(:user)}  # User comes from factories.rb where it references the user model
  	before { visit user_path(factory_user) }

  	it {should have_selector('h1', text: factory_user.full_name)}
  	it {should have_selector('title', text: factory_user.full_name)}
  end


end
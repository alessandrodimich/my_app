require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end


  describe "profile page" do
    let (:foobar) { FactoryGirl.create(:user)}  #let is used to create a local variable, whereas the symbol  :user passed to 
  											#factory girl has to be the same as in factories.rb.
    before { visit user_path(foobar) }

    it { should have_selector('h1',    text: foobar.full_name) }
    it { should have_selector('title', text: foobar.full_name) }
  end

  describe "signup" do

    before {visit signup_path}

    let(:submit) {"Create my account"}
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "After submission" do
        before {click_button submit}
        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
        it { should_not have_content('Password digest')}
      end
    end

    describe "with valid information" do

      before do
        fill_in "user_first_name",   with: "Example"
        fill_in "user_last_name",    with: "User"
        fill_in "user_nickname",     with: "foobarf"
        fill_in "user_email",        with: "user@example.com"
        fill_in "user_password",     with: "foobar2"
        fill_in "user_password_confirmation", with: "foobar2"
      end

      it "should create a new user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    
    describe "After saving a user" do
    
      before { click_button submit }

      let(:user) {User.find_by_email("user@example.com")}

      it { should have_selector('title', text: user.full_name) }

    end
  end

end

end
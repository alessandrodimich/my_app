require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "-Home page:" do  # This test uses a shorter notation making use of the subject {page} above notation
		
		before {visit root_path}

		it {should have_content('Base Title of The Application')}
		it {should have_selector('title', :text => "Base Title of The Application")}
		it {should_not have_selector('title', :text => ' | Home')}
	
	end

	describe "-Help page:" do

		before {visit help_path	}

		it {should have_content('help')}
		it {should have_selector('h1', :text => "Help")}
		it {should have_selector('title', :text => "Base Title of The Application | Help")}
		
	end

	describe "About page" do

		before {visit about_path}

		it "should have the h1 'About Us'" do
			
			page.should have_selector('h1', :text => 'About Us')
		end
		
		it "should have the title 'About Us'" do
			
			page.should have_selector('title', :text => "Base Title of The Application | About Us")
		end 
	end

	describe "Contact page" do

		before {visit contact_path}
		
		it "should have the h1 'Contact'" do
			
			page.should have_selector('h1', text: 'Contact')
		end

		it "should have the title 'Contact'" do
			
			page.should have_selector('title',
				text: "Base Title of The Application | Contact")
		end
  end

end





#Originale
#require 'spec_helper'
# describe "StaticPages" do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get static_pages_index_path
#       response.status.should be(200)
#     end
#   end
# end

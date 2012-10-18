require 'spec_helper'

describe "Static pages" do
	
	describe "-Home page:" do
		it "** It should have the content 'Base Title of The Application' **" do
			visit '/static_pages/home'
			page.should have_content('Base Title of The Application')
		end

		it "should have the base title" do
			visit '/static_pages/home'
			page.should have_selector('title', :text => "Base Title of The Application")
		end

		it "should not have a custom page title" do
			visit '/static_pages/home'
			page.should_not have_selector('title', :text => ' | Home')
		end
	end

	describe "-Help page:" do
		it "** It should have the content 'help' ** " do
			visit '/static_pages/help'
			page.should have_content('help')
		end

		it "should have the h1 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('h1', :text => "Help")
		end

		it "should have the title 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('title', :text => "Base Title of The Application | Help")
		end


	end

	describe "About page" do
		it "should have the h1 'About Us'" do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'About Us')
		end
		
		it "should have the title 'About Us'" do
			visit '/static_pages/about'
			page.should have_selector('title', :text => "Base Title of The Application | About Us")
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

require 'spec_helper'

describe "Home" do
  describe "GET /index" do
  	it "display the home page with ten events" do
  		visit root_path
  		page.should have_content 'Some awesome event'
  	end
  end
end

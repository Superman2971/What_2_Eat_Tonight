require 'spec_helper'

describe "LayoutLinks" do

  it "should have home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "home")
  end

  it "should have help page at '/'" do
    get '/help'
    response.should have_selector('title', :content => "help")
  end

  it "should have about page at '/'" do
    get '/about'
    response.should have_selector('title', :content => "about")
  end

end

class YelpController < ApplicationController
require 'open-uri'
require 'nokogiri'

  def index
    @hello = "HELLO"
    #Scraper of Yelp (prior to location input)
    doc = Nokogiri::HTML(open("http://www.yelp.com/search?find_desc=Food&find_loc=Los+Angeles%2C+CA&ns=1", 'User-Agent' => 'firefox'))
    #CSS Selector Example
    @small_images = doc.css(".pb-90s .photo-box-img")
    #Ruby code to get at the larger images via loops

    #look through and open the hrefs
    #pull the address and restaurant name
    #open the big image
    #save the big image (at least the source code)
    # will later add! Random selection of random number (if less than half pick between 1 to num_on_page, if greater than half go to next page of results, and do again!)

    # TESTING
    # test = doc.css(".biz-name")
    # test.each do |biz|
    #   parsedData = JSON.parse(biz.to_json)
    #   url = parsedData[1][1]
    #   page = Nokogiri::HTML(open("http://www.yelp.com#{url}", 'User-Agent' => 'firefox'))
    #   c = page.css(".see-more")
    #   secondParsedData = JSON.parse(c.to_json)
    #   @pics = secondParsedData[0]
    # end
  end

  def yelp
    parameters = { term: 'restaurant', limit: 10 }
    @response = Yelp.client.search('Los Angeles', parameters)
    @data =  @response.businesses[0].image_url
  end

end

class YelpController < ApplicationController
require "nokogiri"
require "mechanize"
require "open-uri"

  def index
    # create a mechanize instant
    # agent = Mechanize.new
    # agent.get("http://www.yelp.com/search") do |search_page|

    #   searched_page = search_page.form_with(:id => "header_find_form") do |form|
    #     search_field = form.field_with(:class => "search-field")
    #     search_field.value = "Santa Monica"
    #   end.submit

    # end

    #Scraper of Yelp (prior to location input)
    doc = Nokogiri::HTML(open("http://www.yelp.com/search?find_desc=Food&find_loc=Los+Angeles%2C+CA&ns=1#start=10", "User-Agent" => "firefox"))
    #CSS Selector Example
    @small_images = doc.css(".pb-90s .photo-box-img")
    biz =[]
    biz = doc.css(".biz-name")
    @images = []
    (1..10).each do |page|
        url = "http://www.yelp.com/search?find_desc=Food&find_loc=Los+Angeles%2C+CA&ns=1#start=20"
        source = Nokogiri::HTML(open(url, "User-Agent" => "firefox"))
        pic = source.css(".pb-90s .photo-box-img")
        @images.push(pic)
    end

    #ATTEMPT TO GET AT THE BIG PICTURES
    # @url = []
    # biz.each do |href|
    #   @url.push("http://www.yelp.com"+href["href"])
    # end
    # @more_pics = []
    # @url.each do |biz_page|
    #   page = Nokogiri::HTML(open(biz_page, "User-Agent" => "firefox"))
    #   @more_pics.push(page.css(".see-more"))
    # end
    # remove_pic_site = []
    # @pic_site = []
    # more_pics.each do |href|
    #   if href.nil?
    #     remove_pic_site.push(href)
    #   else
    #     @pic_site.push(href)
    #   end
    # end


    @addresses = doc.css("address")
  end

  def yelp
    parameters = { term: "restaurant", limit: 20 }
    @response = Yelp.client.search("Los Angeles", parameters)
    @data =  @response.businesses[0].image_url
  end

end

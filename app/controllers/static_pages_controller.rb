class StaticPagesController < ApplicationController

  def yelp
    parameters = { term: 'restaurant', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
    @data =  @response.businesses[0].image_url
  end

end

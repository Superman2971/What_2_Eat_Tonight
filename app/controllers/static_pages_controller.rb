class StaticPagesController < ApplicationController
  def home
    @Test = "Does this work!"
  end

  def help
  end

  def about
  end

  def yelp
    parameters = { term: 'restaurant', limit: 1 }
    @response = Yelp.client.search('San Francisco', parameters)
    @data =  @response.to_json
  end


end

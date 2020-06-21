require 'net/http'
require 'uri'
require 'httparty'

class SearchController < ApplicationController
  
  def search
    @keyword = params[:keyword]
    url = URI.encode("https://www.googleapis.com/books/v1/volumes?q=#{@keyword}")
    results = HTTParty.get(url)
    @items = results["items"]
  end

end

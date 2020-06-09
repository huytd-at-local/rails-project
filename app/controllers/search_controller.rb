require 'net/http'
require 'uri'
require 'httparty'

class SearchController < ApplicationController
  
  def search
    keyword = params[:keyword]
    url = URI.encode("https://www.googleapis.com/books/v1/volumes?q=#{keyword}&country=VN")
    results = HTTParty.get(url)
      if results["items"]
        @title = results["items"][0]["volumeInfo"]["title"]
        @authors = results["items"][0]["volumeInfo"]["authors"][0]
        @description = results["items"][0]["volumeInfo"]["description"]
        @image = results["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
      else
        @test = "test"
      end
  end

end

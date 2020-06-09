require 'net/http'
require 'uri'
class SearchController < ApplicationController
  
  def search
    if book_name = params[:book_name]
      params = URI.encode_www_form({q: book_name})
      uri = URI.parse("https://www.googleapis.com/books/v1/volumes?#{params}&country=VN")
      response = Net::HTTP.get_response(uri)
      item = JSON.parse(response.body)
      if item["results"]
        @title = item["items"][0]["volumeInfo"]["title"]
        @authors = item["items"][0]["volumeInfo"]["authors"][0]
        @description = item["items"][0]["volumeInfo"]["description"]
        @image = item["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
      else
        @test = "fail"
      end
    end
  end

end

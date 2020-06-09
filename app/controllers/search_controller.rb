class SearchController < ApplicationController
  
  def search
    if postal_code = params[:postal_code]
      params = URI.encode_www_form({zipcode: postal_code})
      uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
      response = Net::HTTP.get_response(uri)
      item = JSON.parse(response.body)
      if item["results"]
        @zipcode = item["results"][0]["zipcode"]
        @address1 = item["results"][0]["address1"]
        @address2 = item["results"][0]["address2"]
        @address3 = item["results"][0]["address3"]
      end
    end
  end

end

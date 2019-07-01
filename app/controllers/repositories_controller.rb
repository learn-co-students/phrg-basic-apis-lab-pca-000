class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "couldnt get working"
    secret = "but here we are"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params[secret] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end

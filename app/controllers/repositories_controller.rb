class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params["client_id"] = "089de6db4130f9938b45"
      req.params["client_secret"] = "4f38f3f15cf8b1a1f2cb1e4fdbf5c8457ad0122f"
      req.params["q"] = params[:query]
    end
    body = JSON.parse(resp.body)
    @items = body["items"]
    render "search"
  end
end

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get "https://api.github.com/search/repositories" do |query|
      query.params['client_id'] = "438b90975a94ef9008f3"
      query.params['client_secret'] = "2856b616022e11f554612edaf5016c61a48a354c"
      query.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@response.body)
    @items = body_hash["items"]
    render 'search'
  end
end

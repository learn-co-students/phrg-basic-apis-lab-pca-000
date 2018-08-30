class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
      req.params['client_id'] = 'c2eb516e9fa796b77566'
      req.params['client_secret'] = 'dc939faeaccc7a14876bb8f9a39f7c2788d38a30'
    end
    body = JSON.parse(resp.body)
    @search_results = body["items"]
    render 'search'
  end
end

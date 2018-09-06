class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'de56b484529dfcf2d702'
      req.params['client_secret'] = 'cf7d2463cd55ea07eb9345ee6f75fe2639604f31'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end

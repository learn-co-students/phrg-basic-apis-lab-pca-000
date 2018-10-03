class RepositoriesController < ApplicationController

  def search; end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '559f73c187c52fa446d6'
      req.params['client_secret'] = '17c8a92547d05e4c7c8de351d236b4ee89aca1c0'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body['items']
    else
      @error = body['meta']['errorDetail']
    end
    render 'search'
  end
end

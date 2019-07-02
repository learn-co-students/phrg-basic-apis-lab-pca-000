class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '78c5a04b370a9d215564'
      req.params['client_secret'] = '0c38835ae2b7725af61d2108a0bb95c1abb5311b'
      req.params['q'] = params[:query]
      # binding.pry
      # req.params['sort'] = 'stars'
      # req.params['order'] = 'desc'
    end

    body = JSON.parse(resp.body)
    @items = body["items"]
    # binding.pry
    render 'search'
  end
end

class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = 'Iv1.0cf8865217c66e40'
    req.params['client_secret'] = 'a4927f03da1e5d96c6174d15a9c68ad55f4e9312'
    req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @name = body["items"][0]["name"]
    @repo_url = body["items"][0]["html_url"]
    @description = body["items"][0]["description"]
      if @resp.success?
      else
        @error = body["meta"]["errorDetail"]
      end
      render 'search'
    end
  end

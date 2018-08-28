class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = 'c12ab5a5aac576dbe275'
    req.params['client_secret'] = 'a941caf4413752b96cc7b1d0dd867d953bd33b55'
    req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    # debugger
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

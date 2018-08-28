class RepositoriesController < ApplicationController

  def search;end

  def github_search
      resp = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params['client_id'] = 'b0fe9b11dbe6fa7f54a2'
        req.params['client_secret'] = '1429be5e9c9bf80ed9c112caa17818372203f6fb'
        req.params["q"] = params[:query]
      end
      body = JSON.parse(resp.body)
      @findings = body["items"]
      render :search
  end
end

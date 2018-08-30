class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '52429d0b996faf96f779'
      req.params['client_secret'] = '06c7bf610396752a18cb61c9f9e46cf5daa9b25c'
      req.params['q'] = params[:query]
    end
      body = JSON.parse(resp.body)
      @response = body["items"]
      render :search
  end
end



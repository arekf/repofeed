# frozen_string_literal: true

require 'net/http'

module GithubAPI
  class Base
    API_URL = 'https://api.github.com'

    protected

    def api_response(endpoint_url)
      api_response = Net::HTTP.get_response(URI(endpoint_url))
      raise GithubAPI::Error, api_response unless api_response.is_a?(Net::HTTPSuccess)

      JSON.parse(api_response.body)
    end
  end
end

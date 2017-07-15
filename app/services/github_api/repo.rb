# frozen_string_literal: true

require 'net/http'

module GithubAPI
  class Repo
    API_URL = 'https://api.github.com'

    attr_reader :owner, :name

    def initialize(owner, name)
      @owner = owner
      @name = name
    end

    def info
      api_response(api_endpoint)
    end

    def commits
      api_response(api_endpoint(:commits))
    end

    private

    def api_response(endpoint_url)
      api_response = Net::HTTP.get_response(URI(endpoint_url))

      raise GithubAPI::Errors::RepoNotFound        if api_response.code == '404'
      raise GithubAPI::Errors::Error, api_response unless api_response.is_a?(Net::HTTPSuccess)

      JSON.parse(api_response.body)
    end

    def api_endpoint(endpoint_name = '')
      endpoint_name = "/#{endpoint_name}" unless endpoint_name.blank?
      "#{API_URL}/repos/#{owner}/#{name}#{endpoint_name}"
    end
  end
end

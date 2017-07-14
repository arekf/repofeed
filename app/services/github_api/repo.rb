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

    def commits
      Rails.cache.fetch(cache_key('commits'), expires_in: 1.minute) do
        commits = api_response(commits_api_endpoint)
        commits.map { |c| Models::Commit.new(c) }
      end
    end

    private

    def api_response(endpoint)
      api_response = Net::HTTP.get_response(URI(endpoint))

      raise GithubAPI::Errors::RepoNotFound if api_response.code == '404'
      raise GithubAPI::Errors::Error, api_response unless api_response.is_a?(Net::HTTPSuccess)

      JSON.parse(api_response.body)
    end

    def commits_api_endpoint
      "#{API_URL}/repos/#{owner}/#{name}/commits"
    end

    def cache_key(endpoint)
      "#{owner}/#{name}/#{endpoint}"
    end
  end
end

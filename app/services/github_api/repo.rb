# frozen_string_literal: true

module GithubAPI
  class Repo < Base
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

    def api_endpoint(endpoint_name = '')
      endpoint_name = "/#{endpoint_name}" unless endpoint_name.blank?
      "#{GithubAPI::Base::API_URL}/repos/#{owner}/#{name}#{endpoint_name}"
    end
  end
end

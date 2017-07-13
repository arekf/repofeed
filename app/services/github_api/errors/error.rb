module GithubAPI
  module Errors
    class Error < StandardError
      attr_reader :api_response

      def initialize(api_response)
        @api_response = api_response
      end

      def to_s
        "Could not connect to GitHub API, details: #{api_response.body.inspect}"
      end
    end
  end
end

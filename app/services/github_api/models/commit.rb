module GithubAPI
  module Models
    class Commit
      attr_reader :attributes

      def initialize(attributes)
        @attributes = attributes
      end

      def message
        attributes['commit']['message']
      end
    end
  end
end

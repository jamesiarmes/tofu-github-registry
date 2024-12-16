# frozen_string_literal: true

require 'github_api'

module TofuGithubRegistry
  module Helpers
    # Helpers for working with GitHub.
    module Github
      VALID_URL = %r{https://github\.com(?:/[^\s/]+){2}$}

      def parse_repo_url(url)
        validate_repo_url(url)
        URI.parse(url).path[1..].split('/', 2)
      end

      def repo_tags(repo)
        owner, repo = parse_repo_url(repo)
        ::Github.new.repos.tags owner, repo
      end

      def validate_repo_url(url)
        return true if url.match?(VALID_URL)

        raise URI::InvalidURIError, "Invalid github repository url: #{url}"
      end
    end
  end
end

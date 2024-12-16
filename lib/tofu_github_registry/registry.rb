# frozen_string_literal: true

require 'github_api'
require 'grape'

require_relative 'discovery'
require_relative 'modules'

module TofuGithubRegistry
  # OpenTofu registry API.
  class Registry < Grape::API
    format :json

    mount Discovery
    mount Modules
  end
end

# frozen_string_literal: true

require 'configsl'

module TofuGithubRegistry
  module Config
    # Configuration for an individual module
    class Module < ConfigSL::Config
      option :description, type: String
      option :name, type: String, required: true
      option :namespace, type: String, required: true
      option :repository, type: String, required: true
      option :system, type: String, required: true
    end
  end
end

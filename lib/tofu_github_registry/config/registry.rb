# frozen_string_literal: true

require 'configsl'

require_relative 'module'

module TofuGithubRegistry
  module Config
    # Configuration for the registry.
    class Registry < ConfigSL::Config
      config_file_name 'config'
      config_file_path 'config'

      register_file_format :yaml

      option :name, type: String, required: true
      option :modules, type: Array, required: true

      # When retrieving the list of modules, convert the raw data into Module
      # configurations.
      #
      # @return [Array<Module>]
      def modules
        @modules ||= get_value(:modules).map { |m| Module.new(m) }
      end
    end
  end
end

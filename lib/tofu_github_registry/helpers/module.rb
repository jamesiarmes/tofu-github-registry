# frozen_string_literal: true

require_relative '../config/registry'

module TofuGithubRegistry
  module Helpers
    # Helpers for modules.
    module Module
      def lookup_module
        config = TofuGithubRegistry::Config::Registry.from_file
        config.modules.find do |m|
          m.namespace == params[:namespace] &&
            m.name == params[:name] &&
            m.system == params[:system]
        end
      end
    end
  end
end

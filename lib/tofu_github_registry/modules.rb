# frozen_string_literal: true

require_relative 'helpers/github'
require_relative 'helpers/module'

module TofuGithubRegistry
  # Endpoints for modules.
  class Modules < Grape::API
    version 'v1', using: :path

    helpers Helpers::Github
    helpers Helpers::Module

    resource :modules do
      get ':namespace/:name/:system/versions' do
        module_config = lookup_module
        tags = repo_tags(module_config.repository)

        {
          modules: [{ versions: tags.map { |tag| { version: tag.name } } }]
        }
      end

      params do
        requires :namespace, type: String
        requires :name, type: String
        requires :system, type: String
        # TODO: Support the full semantic versioning spec.
        requires :semver, type: String, regexp: /^\d+\.\d+\.\d+$/
      end
      get ':namespace/:name/:system/*semver/download' do
        module_config = lookup_module
        location = "git::#{module_config.repository}?ref=#{params[:semver]}"
        header 'x-terraform-get', location

        {
          location:
        }
      end
    end
  end
end

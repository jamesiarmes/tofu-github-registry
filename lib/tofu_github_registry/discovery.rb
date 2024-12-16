# frozen_string_literal: true

module TofuGithubRegistry
  # Remote service discovery endpoint.
  class Discovery < Grape::API
    get '.well-known/terraform.json' do
      {
        'modules.v1' => '/v1/modules/'
      }
    end
  end
end

# frozen_string_literal: true

require_relative 'lib/tofu_github_registry/version'

Gem::Specification.new do |s|
  s.name        = 'tofu-github-registry'
  s.version     = TofuGithubRegistry::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'An OpenTofu registry backed by GitHub.'
  s.description = s.summary
  s.authors     = ['James I. Armes']
  s.email       = 'jamesiarmes@gmail.com'
  s.files       = Dir['lib/**/*'] + Dir['Gemfile']
  s.extra_rdoc_files = %w[README.md CHANGELOG.md]
  s.homepage    = 'https://github.com/jamesiarmes/tofu-github-registry'
  s.metadata    = {
    'bug_tracker_uri' => 'https://github.com/jamesiarmes/tofu-github-registry/issues',
    'changelog_uri' => 'https://github.com/jamesiarmes/tofu-github-registry/blob/main/CHANGELOG.md',
    'homepage_uri' => s.homepage,
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => 'https://github.com/jamesiarmes/tofu-github-registry'
  }

  s.required_ruby_version = '>= 3.3'

  s.add_dependency 'configsl', '~> 1.0'
  s.add_dependency 'falcon', '~> 0.47'
  s.add_dependency 'github_api', '~> 0.19'
  s.add_dependency 'grape', '~> 2.2'
  s.add_dependency 'rack', '~> 3.1'
end

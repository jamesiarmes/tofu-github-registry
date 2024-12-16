# frozen_string_literal: true

require 'bundler'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: %i[lint spec]

RuboCop::RakeTask.new(:lint) do |task|
  task.requires << 'rubocop'
  task.formatters = %w[pacman]
  task.formatters << 'github' if ENV.fetch('GITHUB_ACTIONS', false)
end

RSpec::Core::RakeTask.new(:spec)

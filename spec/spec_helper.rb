# frozen_string_literal: true

require 'rspec'
require 'rspec_pacman_formatter'

if ENV['COVERAGE'] == '1'
  require 'simplecov'

  SimpleCov.start do
    add_filter '/spec/'
    track_files 'lib/**/*.rb'
  end
end

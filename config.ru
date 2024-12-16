# frozen_string_literal: true

require_relative 'lib/tofu-github-registry'

use Rack::RewindableInput::Middleware
use Rack::CommonLogger
# API::API.logger.level = Logger::DEBUG

run TofuGithubRegistry::Registry

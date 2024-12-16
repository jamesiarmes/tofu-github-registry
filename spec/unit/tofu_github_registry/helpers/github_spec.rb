# frozen_string_literal: true

require 'rspec'

require_relative '../../../../lib/tofu_github_registry/helpers/github'

RSpec.describe TofuGithubRegistry::Helpers::Github do
  include described_class

  let(:github) { instance_double(Github::Client) }

  before do
    allow(Github).to receive(:new).and_return(github)
  end

  describe '#parse_repo_url' do
    it 'parses valid repo url' do
      expect(parse_repo_url('https://github.com/owner/repo')).to eq(%w[owner repo])
    end

    it 'raises an error for an invalid repo url' do
      url = 'invalid_url'
      expect { parse_repo_url(url) }.to raise_error(URI::InvalidURIError)
    end
  end

  describe '#repo_tags' do
    let(:tags) do
      [
        Github::Mash.new(name: '1.0.0'),
        Github::Mash.new(name: '1.1.0')
      ]
    end

    before do
      repos = instance_double(Github::Client::Repos)
      allow(github).to receive(:repos).and_return(repos)
      allow(repos).to receive(:tags).with('owner', 'repo').and_return(tags)
    end

    it 'returns tags for a valid repo url' do
      expect(repo_tags('https://github.com/owner/repo')).to eq(tags)
    end

    it 'raises an error for an invalid repo url' do
      expect { repo_tags('invalid_url') }.to raise_error(URI::InvalidURIError)
    end
  end

  describe '#validate_repo_url' do
    it 'returns true for a valid repo url' do
      expect(validate_repo_url('https://github.com/owner/repo')).to be true
    end

    it 'raises an error for an invalid repo url' do
      expect { validate_repo_url('invalid_url') }.to raise_error(URI::InvalidURIError)
    end

    it 'raises an error for a repo url with subpaths' do
      url = 'https://github.com/owner/repo/subpath'
      expect { validate_repo_url(url) }.to raise_error(URI::InvalidURIError)
    end

    it 'raises an error for an empty repo url' do
      expect { validate_repo_url('') }.to raise_error(URI::InvalidURIError)
    end
  end
end

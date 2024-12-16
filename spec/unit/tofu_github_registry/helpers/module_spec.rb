# frozen_string_literal: true

require 'rspec'

require_relative '../../../../lib/tofu_github_registry/helpers/module'

RSpec.describe TofuGithubRegistry::Helpers::Module do
  include described_class

  let(:config) do
    TofuGithubRegistry::Config::Registry.new(
      modules: [
        { namespace: 'rspec', name: 'bigtable', system: 'google' },
        { namespace: 'rspec', name: 'eks', system: 'aws' }
      ]
    )
  end

  let(:params) { { namespace: 'rspec', name: 'eks', system: 'aws' } }

  before do
    allow(TofuGithubRegistry::Config::Registry).to receive(:from_file)
      .and_return(config)
  end

  describe '#lookup_module' do
    shared_examples 'returns nil' do |p = {}|
      let(:params) { p }
      it { expect(lookup_module).to be_nil }
    end

    it 'returns the correct module for valid parameters' do
      expect(lookup_module).to eq(config.modules[1])
    end

    context 'when the namespace is invalid' do
      include_examples 'returns nil',
                       namespace: 'invalid', name: 'eks', system: 'aws'
    end

    context 'when the name is invalid' do
      include_examples 'returns nil',
                       namespace: 'rspec', name: 'invalid', system: 'aws'
    end

    context 'when the system is invalid' do
      include_examples 'returns nil',
                       namespace: 'rspec', name: 'eks', system: 'invalid'
    end

    context 'when all parameters are invalid' do
      include_examples 'returns nil',
                       namespace: 'invalid', name: 'invalid', system: 'invalid'
    end

    context 'when the parameters are empty' do
      include_examples 'returns nil', namespace: '', name: '', system: ''
    end

    context 'when there are no parameters' do
      include_examples 'returns nil'
    end
  end
end

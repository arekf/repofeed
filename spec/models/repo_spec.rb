# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repo do
  subject { create(:repo, owner: 'turbolinks', name: 'turbolinks') }

  context '#url' do
    it 'builds url' do
      expect(subject.url).to eq 'https://github.com/turbolinks/turbolinks'
    end
  end

  context '#issues_url' do
    it 'builds issues url' do
      expect(subject.issues_url).to eq 'https://github.com/turbolinks/turbolinks/issues'
    end
  end
end

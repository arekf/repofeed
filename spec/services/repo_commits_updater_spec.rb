# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepoCommitsUpdater, type: :service do
  subject { create(:repo, owner: 'rails', name: 'rails') }

  before do
    VCR.use_cassette('repo_commits_updater') do
      described_class.new(subject).update_commits
    end
  end

  let(:commit) { subject.commits.first }

  it 'creates commits' do
    expect(subject.commits.count).to eq 30
  end

  it 'sets commit sha' do
    expect(commit.sha).to eq '89182d681013e42c514860b24f197ab84a8662f5'
  end

  it 'sets commit date' do
    expect(commit.commited_at).to eq DateTime.new(2017, 7, 15, 16, 13, 49)
  end

  it 'sets commit author name' do
    expect(commit.author_name).to eq 'Kasper Timm Hansen'
  end

  it 'sets commit author email' do
    expect(commit.author_email).to eq 'kaspth@gmail.com'
  end

  it 'sets commit author avatar url' do
    expect(commit.author_avatar_url).to eq 'https://avatars4.githubusercontent.com/u/350807?v=4'
  end
end

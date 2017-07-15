# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GithubAPI::Repo, type: :service do
  context 'valid repo' do
    let!(:repo) { create(:repo, owner: 'rails', name: 'rails') }

    context 'info' do
      subject do
        VCR.use_cassette('github_api_repo_valid_repo_info') do
          described_class.new(repo.owner, repo.name).info
        end
      end

      it 'returns repo info' do
        expect(subject).not_to be_nil
      end

      %w[owner stargazers_count open_issues_count].each do |attr|
        it "includes #{attr}" do
          expect(subject.key?(attr)).to be_truthy
        end
      end
    end

    context 'commits' do
      subject do
        VCR.use_cassette('github_api_repo_valid_repo_commits') do
          described_class.new(repo.owner, repo.name).commits
        end
      end

      let(:commit) { subject.first }

      it 'returns commits' do
        expect(subject.count).to eq 30
      end

      it 'includes commit message' do
        expect(commit['commit'].key?('message')).to be_truthy
      end

      %w[date name email].each do |attr|
        it "includes author #{attr}" do
          expect(commit['commit']['author'].key?(attr)).to be_truthy
        end
      end

      it 'includes author avatar url' do
        expect(commit['author']['avatar_url']).to be_truthy
      end
    end
  end

  context 'inexistent repo' do
    let!(:repo) { create(:repo, owner: 'crazyowner12091', name: 'grumpyname03922') }

    context 'info' do
      subject do
        VCR.use_cassette('github_api_repo_inexistent_repo_info') do
          described_class.new(repo.owner, repo.name).info
        end
      end

      it 'throws repo not found error' do
        expect { subject }.to raise_error GithubAPI::Errors::RepoNotFound
      end
    end

    context 'info' do
      subject do
        VCR.use_cassette('github_api_repo_inexistent_repo_commits') do
          described_class.new(repo.owner, repo.name).commits
        end
      end

      it 'throws repo not found error' do
        expect { subject }.to raise_error GithubAPI::Errors::RepoNotFound
      end
    end
  end
end

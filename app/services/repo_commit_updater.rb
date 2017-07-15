# frozen_string_literal: true

class RepoCommitUpdater
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def update_commits
    commits = GithubAPI::Repo.new(repo.owner, repo.name).commits

    commits.each do |attributes|
      repo.commits.find_or_create_by(sha: attributes['sha']) do |commit|
        commit.message           = attributes['commit']['message']
        commit.commited_at       = attributes['commit']['author']['date'].to_datetime
        commit.author_name       = attributes['commit']['author']['name']
        commit.author_email      = attributes['commit']['author']['email']
        commit.author_avatar_url = attributes['author']['avatar_url']
      end
    end
  end
end

# frozen_string_literal: true

class RepoInfoUpdater
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def update_info
    repo.update_in_progress!

    info = repo_api.info

    repo.stars_count       = info['stargazers_count']
    repo.open_issues_count = info['open_issues_count']
    repo.owner_avatar_url  = info['owner']['avatar_url']
    repo.update_status     = 'update_finished'

    repo.save!
  rescue
    repo.update_errored!
  end

  private

  def repo_api
    @repo_api ||= GithubAPI::Repo.new(repo.owner, repo.name)
  end
end

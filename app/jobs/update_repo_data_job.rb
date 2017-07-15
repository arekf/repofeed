# frozen_string_literal: true

class UpdateRepoDataJob < ApplicationJob
  queue_as :default

  def perform(repo)
    RepoInfoUpdater.new(repo).update_info
    RepoCommitsUpdater.new(repo).update_commits
  end
end

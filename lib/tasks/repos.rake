# frozen_string_literal: true

namespace :repos do
  desc 'Update latest commit data'
  task update_commits: :environment do
    Repo.find_each do |repo|
      puts "Updating commits for #{repo.owner}/#{repo.name}..."
      RepoCommitsUpdater.new(repo).update_commits
    end
  end

  desc 'Update repo info'
  task update_info: :environment do
    Repo.find_each do |repo|
      puts "Updating info for #{repo.owner}/#{repo.name}..."
      RepoInfoUpdater.new(repo).update_info
    end
  end
end

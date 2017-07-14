namespace :repos do
  desc "Update latest commit data"
  task update_commits: :environment do
    Repo.find_each do |repo|
      puts "Updating commits for #{repo.owner}/#{repo.name}..."
      RepoCommitUpdater.new(repo).update_commits
    end
  end
end

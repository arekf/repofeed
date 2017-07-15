class Commit < ApplicationRecord
  belongs_to :repo

  def message_subject
    message.split("\n").first
  end

  def message_body
    message.split("\n").drop(1).join("\n")
  end

  def url
    "https://github.com/#{repo.owner}/#{repo.name}/commit/#{sha}"
  end
end

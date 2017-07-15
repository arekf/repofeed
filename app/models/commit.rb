# frozen_string_literal: true

class Commit < ApplicationRecord
  validates :sha,          presence: true, format: /\A[a-f0-9]{40}\z/
  validates :message,      presence: true
  validates :commited_at,  presence: true
  validates :author_name,  presence: true
  validates :author_email, presence: true

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

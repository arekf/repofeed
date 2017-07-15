# frozen_string_literal: true

class Repo < ApplicationRecord
  validates :owner, presence: true
  validates :name,  presence: true

  has_many :commits, dependent: :destroy

  def url
    "https://github.com/#{owner}/#{name}"
  end

  def issues_url
    url + '/issues'
  end
end

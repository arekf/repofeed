# frozen_string_literal: true

class Repo < ApplicationRecord
  validates :owner, presence: true
  validates :name,  presence: true
end

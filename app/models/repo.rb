class Repo < ApplicationRecord
  validates :owner, presence: true
  validates :name,  presence: true
end

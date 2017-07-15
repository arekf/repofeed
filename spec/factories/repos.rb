# frozen_string_literal: true

FactoryGirl.define do
  factory :repo do
    sequence(:owner) { |n| "owner-#{n}" }
    sequence(:name)  { |n| "name-#{n}" }
  end
end

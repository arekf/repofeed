# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Commit do
  let!(:repo) { create(:repo, owner: 'nick', name: 'game') }

  subject do
    Commit.create!(
      sha: '504f22cd8cf54cd3da1449ac9202a6ef005aea54',
      commited_at: Time.zone.now,
      message: "This is a\nvery\nlong\ncommit message",
      author_name: 'Nick Bold',
      author_email: 'nbold@mail.com',
      repo: repo
    )
  end

  context '#url' do
    it 'builds url' do
      expect(subject.url).to eq 'https://github.com/nick/game/commit/504f22cd8cf54cd3da1449ac9202a6ef005aea54'
    end
  end

  context '#message_subject' do
    it 'returns first line of message' do
      expect(subject.message_subject).to eq 'This is a'
    end
  end

  context '#message_body' do
    it 'returns all but first line of message' do
      expect(subject.message_body).to eq "very\nlong\ncommit message"
    end
  end
end

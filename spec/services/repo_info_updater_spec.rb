# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepoInfoUpdater, type: :service do
  context 'valid repo' do
    subject { create(:repo, owner: 'rails', name: 'rails') }

    before do
      VCR.use_cassette('repo_info_updater_valid_repo') do
        described_class.new(subject).update_info
      end
    end

    it 'sets stars count' do
      expect(subject.stars_count).to eq 36_320
    end

    it 'sets open issues count' do
      expect(subject.open_issues_count).to eq 1205
    end

    it 'sets avatar url' do
      expect(subject.owner_avatar_url).to eq 'https://avatars5.githubusercontent.com/u/4223?v=4'
    end

    it 'sets update status' do
      expect(subject.update_finished?).to be_truthy
    end
  end

  context 'inexistent repo' do
    subject { create(:repo, owner: 'oddowner12322', name: 'weirdname19393') }

    before do
      VCR.use_cassette('repo_info_updater_inexistent_repo') do
        described_class.new(subject).update_info
      end
    end

    it 'sets status as errored' do
      expect(subject.update_errored?).to be_truthy
    end
  end
end

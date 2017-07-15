# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReposController, type: :controller do
  context 'GET #index' do
    context 'no repos' do
      it 'redirects to new repo page' do
        get :index

        expect(response).to redirect_to new_repo_path
      end
    end

    context 'repos exist' do
      let!(:repo) { create(:repo) }

      it 'redirects to the repo' do
        get :index

        expect(response).to redirect_to repo
      end
    end
  end

  context 'POST #create' do
    it 'queues repo data update' do
      expect do
        post :create, params: { repo: { owner: 'rails', name: 'rails' } }
      end.to have_enqueued_job(UpdateRepoDataJob)
    end
  end
end

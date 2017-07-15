# frozen_string_literal: true

class ReposController < ApplicationController
  before_action :set_repo, only: %i[show destroy]

  def index
    redirect_to(new_repo_path) && return unless Repo.exists?
    redirect_to Repo.first
  end

  def show
    @repos = Repo.all
  end

  def new
    @repo = Repo.new
  end

  def create
    @repo = Repo.new(repo_params)

    if @repo.save
      UpdateRepoDataJob.perform_later(@repo)
      redirect_to @repo
    else
      render :new
    end
  end

  def destroy
    @repo.destroy
    redirect_to repos_url
  end

  private

  def set_repo
    @repo = Repo.find(params[:id])
  end

  def repo_params
    params.require(:repo).permit(:owner, :name)
  end
end

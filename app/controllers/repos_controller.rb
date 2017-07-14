# frozen_string_literal: true

class ReposController < ApplicationController
  before_action :set_repo, only: %i[show edit update destroy]
  before_action :set_repos, only: %i[index show]

  def index
    @repo = @repos.first
  end

  def new
    @repo = Repo.new
  end

  def create
    @repo = Repo.new(repo_params)

    if @repo.save
      redirect_to @repo, notice: 'Repo was successfully created.'
    else
      render :new
    end
  end

  def update
    if @repo.update(repo_params)
      redirect_to @repo, notice: 'Repo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @repo.destroy
    redirect_to repos_url, notice: 'Repo was successfully destroyed.'
  end

  private

  def set_repo
    @repo = Repo.find(params[:id])
  end

  def set_repos
    @repos = Repo.all
  end

  def repo_params
    params.require(:repo).permit(:owner, :name)
  end
end

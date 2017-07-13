class ReposController < ApplicationController
  before_action :set_repo, only: [:show, :edit, :update, :destroy]

  def index
    @repos = Repo.all
  end

  def show
    @commits = GithubAPI::Repo.new(@repo.owner, @repo.name).commits

  rescue GithubAPI::Errors::RepoNotFound
    redirect_to repos_path, notice: 'This repository does not exist'
  rescue GithubAPI::Errors::Error
    redirect_to repos_path, notice: 'There was an error connecting with GitHub API. Try again soon'
  end

  def new
    @repo = Repo.new
  end

  def edit
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

    def repo_params
      params.require(:repo).permit(:owner, :name)
    end
end

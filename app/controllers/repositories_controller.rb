class RepositoriesController < ApplicationController
  def index
     gitserv = GithubService.new({"access_token" => session[:token]})
    @repos_array = gitserv.get_repos
  end

  def create
    gitserv = GithubService.new({"access_token" => session[:token]})
    gitserv.create_repo(params[:name])
    redirect_to '/'
  end
end

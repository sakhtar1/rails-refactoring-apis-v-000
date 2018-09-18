class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    gitserv = GithubService.new
    session[:token] = gh.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:username] = gitserv.get_username

    redirect_to '/'
  end
end

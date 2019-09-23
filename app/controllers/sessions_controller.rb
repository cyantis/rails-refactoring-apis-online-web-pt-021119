class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    github = GithubService.new
    session[:token] = github.authenticate!(client_id, client_secret, params[:code])

    session[:username] = github.get_username
    @username = session[:username]

    redirect_to '/'
  end
end

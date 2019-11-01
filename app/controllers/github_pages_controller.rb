class GithubPagesController < ApplicationController
  def index
    github = Github.new

    @repos_from_github = github.repos.list(user: "vamsikri-hash")
    #puts @repos_from_github[1]

  end
end

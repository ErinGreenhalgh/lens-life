class ReposController < ApplicationController
  def index
    @user  = current_user
    @repos = Repo.all(@user)
  end
end

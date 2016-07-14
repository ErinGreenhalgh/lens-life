class EventsController < ApplicationController

  def index
    @user = current_user
    # @commits = Event.new(@user).commits
    @commits = Event.commits(@user)
  end

end

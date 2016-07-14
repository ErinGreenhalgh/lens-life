class EventsController < ApplicationController

  def index
    @user = current_user
    @commits = Event.commits(@user)
  end

end

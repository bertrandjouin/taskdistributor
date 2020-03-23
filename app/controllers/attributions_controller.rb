class AttributionsController < ApplicationController

def new
  @user = current_user
  @tasks = @user.tasks
  @players = @user.players
end

def create
playersselect(@players)
end


def playersselect(players)
  @player = players.sample
end

end

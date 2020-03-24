class MixandmatchesController < ApplicationController

def new
  @mixandmatch = Mixandmatch.new()
  @attribution = Attribution.new()
end

def create
  @mixandmatch = Mixandmatch.new()
  @mixandmatch.save
  @attribution = Attribution.new()
  @user = current_user
  @tasks = @user.tasks
  @players = @user.players
  redirect_to mixandmatch_path(@mixandmatch)

end

def show
  @attribution = Attribution.new()
  @mixandmatch = Mixandmatch.find(params[:id])
  @user = current_user
  @tasks = @user.tasks
  @players = @user.players

  @task = @user.tasks.first
  @player = @user.players.first
  @attribution = Attribution.new()
  @attribution.task_id = @task.id
  @attribution.player_id = @player.id
  @attribution.mixandmatch_id = @mixandmatch.id
  @attribution.save
end

end

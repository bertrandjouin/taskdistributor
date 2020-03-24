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
  @mixandmatch.attributions.destroy
  @user = current_user
  @tasks = @user.tasks
  @players = @user.players
  randomtaskattribution()
  @attribution.save
end

def randomtaskattribution
  @tasks.shuffle.each do |task|
  @attribution = Attribution.new()
  @attribution.task_id = task.id
  @attribution.mixandmatch_id = @mixandmatch.id
  end
    @players.each do |player|
    @attribution.player_id = player.id
  end

end


end

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
  @tasks.shuffle.each do |task|
    randomtaskattribution(task)
    @attribution.save
  end

end

def randomtaskattribution(task)

  @attribution = Attribution.new()
  @attribution.task_id = task.id
  @attribution.mixandmatch_id = @mixandmatch.id
    @players.each do |player|
    @attribution.player_id = player.id
  end

end


end

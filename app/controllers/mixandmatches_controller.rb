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
  @mixandmatch = Mixandmatch.find(params[:id])
  @mixandmatch.attributions.destroy
  @user = current_user
  @tasks = @user.tasks
  @players = @user.players
  @tasks.each do |task|
    randomtaskattribution(task)
  end
end

def randomplayerid(players)
  return players.order("RANDOM()").first.id
  players = players.delete(player)
end



def randomtaskattribution(task)
  @attribution = Attribution.new()
  @attribution.task_id = task.id
  @players = @user.players
  @attribution.player_id = randomplayerid(@players)
  @attribution.mixandmatch_id = @mixandmatch.id
  @attribution.save
end




end

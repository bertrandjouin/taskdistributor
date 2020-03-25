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
    @attribution = Attribution.new()
    @user = current_user
    @tasks = @user.tasks.to_a
    @players = @user.players.shuffle.to_a
    i = 0
    @tasks.shuffle.each do |task|
      @attribution = Attribution.new
      @attribution.task_id = task.id
      @attribution.mixandmatch_id = @mixandmatch.id
      @attribution.player = @players[i]
      if i < @players.count
        i += 1
      else
        @attribution.player = @players.sample
      end
      @attribution.save
    end
  end
end

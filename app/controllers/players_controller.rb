class PlayersController < ApplicationController

  def new
    @user = current_user
    @player = Player.new()
    @players = @user.players
    @tasks = @user.tasks
    @mixandmatch = Mixandmatch.new()
  end

  def create
    @player = Player.new(player_params)
    @player.user = current_user
    @user = current_user
    @players = @user.players
    @mixandmatch = Mixandmatch.new()
    if @player.save
      redirect_to players_path
    else
      render :index
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to new_player_path
  end

  def index
    @user = current_user
    @players = @user.players
    @player = Player.new()
    @mixandmatch = Mixandmatch.new()
  end


  private

  def player_params
    params.require(:player).permit(:pseudo, :user_id, :id)
  end





end

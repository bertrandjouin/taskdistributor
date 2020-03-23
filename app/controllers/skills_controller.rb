class SkillsController < ApplicationController

def new
  @player = Player.find(params[:player_id])
  @skill = Skill.new()
end
def create
end

end

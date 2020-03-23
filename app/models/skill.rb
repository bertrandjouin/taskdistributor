class Skill < ApplicationRecord
  belongs_to :player
  belongs_to :task
end

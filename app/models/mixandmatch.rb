class Mixandmatch < ApplicationRecord
  has_many :attributions
  has_many :tasks, through: :attributions
  has_many :players, through: :attributions
end
